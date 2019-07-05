import
    sdl2,
    sdl2/ttf

import
    constants,
    direction,
    keyboard,
    matrix,
    render_utils,
    textures,
    utils,
    vector


type
    Screen* = enum none, menu, world, inventory, combat, transition

    Game* = ref object
        shouldQuit*: bool
        prefs*: Preferences
        keyboard*: Keyboard
        renderInfo*: RenderInfo
        window*: WindowPtr
        screen*: Screen
        mainMenu*: MainMenuScreen
        inventory*: Inventory
        combat*: CombatScreen
        combatTransition*: CombatTransitionScreen
        gameState*: GameState

    Preferences* = object
        scaleModePixelPerfect*: bool
        fullscreen*: WindowMode

    WindowMode* {.pure.} = enum
        windowed = "Windowed"
        fullscreenWindowed = "Fullscreen Windowed"
        fullscreen = "Fullscreen"

    GameState* = object
        level*: Level
        inspectMode*: bool
        inspectCursor*: Vec2
        playerParty*: seq[Character]
        entities*: seq[Character]

    Level* = object
        walls*: Matrix[bool]
        textures*: Matrix[sdl2.Rect]
        decals*: Matrix[TextureAlias] # TODO these should be tiles also
        shadowMask1*: Matrix[bool]
        shadowMask2*: Matrix[bool]
        seen*: Matrix[bool]
        entrance*: Vec2
        exit*: Vec2
        collision*: proc (pos: Vec2): bool {.noSideEffect.}
        dynamicEntities*: Matrix[Character]

    Inventory* = object
        inMenu*: bool

    CombatScreen* = object
        playerParty*: seq[Character]
        enemyParty*: seq[Character]
        turnOrder*: seq[Character]
        center*: Vec2
        privateState: CombatState
        turn*: int
        activeAbility*: Ability
        activeTarget*: AbilityTarget
        turnPointsRemaining*: int
        movementStart*: Vec2
        mapCursor*: Vec2
        menuCursor*: int
        messageLog*: seq[string]
        tempMessage*: string
        aoeAuras*: Matrix[AoeAura]
        animationTimer*: int
        rangedAbilityMovementPathIndex*: int

    CombatTransitionScreen* = object
        startWindow*: Rect
        endWindow*: Rect
        timeElapsed*: float
        whenDone*: ScreenChange

    CombatState* {.pure.} = enum
        pickingAbility,
        pickingAbilityTarget,
        pickingRangedAbilitySecondaryTarget
        playingAinimation


    # **************************
    #          Items
    # **************************

    # Clothing

    Clothing* = object
        icon*: TextureAlias
        clothingInfo*: ClothingInfo

    ClothingInfo* = object
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        slot*: ClothingSlot

    ClothingSlot* {.pure.} = enum
        head, body, feet
    
    # Mods

    Stat* {.pure.} = enum
        maxHp,
        armor,
        magicResist,
        initiative,
        accuracy,
        dodge,
        strength,
        intelect,
        combatSpeed
    
    Modifier* = object
        name*: string
        icon*: TextureAlias
        description*: string
        statMod*: array[Stat, int]

    # Weapons

    Weapon* = object
        name*: string
        icon*: TextureAlias
        weaponInfo*: WeaponInfo

    WeaponInfo* = object
        baseDamage*: int
        critChance*: float
        critBonus*: float
        weaponRange*: float
        handedness*: Handed
        getStat*: proc(stat: Stat, baseValue: int): int
        magicAfterEffect*: proc(caster, target: Character, level: var Level)
        kineticAfterEffect*: proc(caster, target: Character, level: var Level)
        magicAoeAfterEffect*: proc(caster: Character, target: Vec2,
                                   aoe: seq[Vec2], level: var Level)
        kineticAoeAfterEffect*: proc(caster: Character, target: Vec2,
                                     aoe: seq[Vec2], level: var Level)

    Handed* {.pure.} = enum single, double

    Effect* = object
        getStat*: proc(stat: Stat, currentValue: int): int
        onTurnStart*: proc(self: Character, level: var Level, combat: var CombatScreen)
        afterAttack*: proc(self, target: Character, level: var Level)
        afterAoeAttack*: proc(self: Character, target: Vec2, level: var Level)

    # **************************
    #         Characters
    # **************************

    CharacterType* {.pure.} = enum humanoid, animal

    Character* = ptr CharacterData

    CharacterData* = object
        currentTile*: Vec2
        nextTile*: Vec2
        actualPos*: Vec2f
        facing*: Direction
        speed*: float
        race*: Race
        sex*: Sex
        spritesheet*: TextureAlias
        class*: Class
        health*: int
        statMods*: array[Stat, int]
        auras*: seq[Aura]
        unlockedAbilities*: seq[Ability]
        weapon*: Weapon

        ai*: AI
        following*: Character

        case kind*: CharacterType
        of humanoid:
            clothes*: array[ClothingSlot, Clothing]
        of animal: discard

    Class* = object
        name*: string
        isMagicUser*: bool
        startingAbilities*: seq[Ability]
        stats*: array[Stat, int]

    Race* = object
        name*: string
        baseSpritesheetMale*: TextureAlias
        baseSpritesheetFemale*: TextureAlias
        defaultAI*: AI

    Sex* = enum male, female

    # **************************
    #         Abilities
    # **************************

    AbilityType* {.pure.} = enum
        targeted, dash, ranged, untargeted

    Ability* = object
        name*: string
        turnCost*: int
        case abilityType*: AbilityType
        of dash: 
            pattern*: seq[seq[Vec2]]
        of ranged: 
            movementPattern*: seq[seq[Vec2]]
            canJump*: bool
            projectilePattern*: seq[seq[Vec2]]
            hasFriendlyFire*: bool
        else:
            discard

        isValidCaster*: proc(caster: Character): bool
        isValidTarget*: proc(caster: Character,
                             target: AbilityTarget): bool
        applyEffect*: proc(caster, target: Character, weaponInfo: WeaponInfo)

    AbilityTargetType* = enum TargetNone, TargetCharacter, TargetTile
    AbilityTarget* = object
        case kind*: AbilityTargetType
        of TargetCharacter:
            character*: Character
        of TargetTile:
            tile*: Vec2
        of TargetNone:
            discard

    TargetIntention* = object
        case abilityType*: AbilityType
        of targeted:
            target*: Vec2
        of dash:
            pathIndex*: int
        of ranged:
            movementPathIndex*: int
            projectilePathIndex*: int
        of untargeted:
            discard

    DamageType* {.pure.} = enum physical, magical, trueDamage


    AI* = tuple[
        worldMovement: proc(self: Character,
                            others: seq[Character],
                            level: var Level),
        chooseAttack: proc(self: Character,
                           allies, enemies: seq[Character],
                           level: Level): (Ability, TargetIntention)
    ]

    AoeAura* = object
        turns*: int
        caster*: Character
        texture*: TextureAlias
        effect*: proc(character: Character)

    Aura* = object
        turns*: int
        icon*: TextureAlias
        effect*: Effect

    ScreenChange* = object
        case changeTo*: Screen
        of Screen.combat:
            playerParty*, enemyParty*: seq[Character]
        of Screen.transition:
            startWindow*, endWindow*: Rect
            whenDone*: ref ScreenChange
        of Screen.inventory:
            pickupWeapons*: seq[Weapon]
            pickupMods*: seq[Modifier]
        of Screen.menu:
            previousScreen*: Screen
        of Screen.world:
            discard
        of Screen.none:
            discard

    # **************************
    #          Menu
    # **************************

    MainMenuScreen* = object
        previousScreen*: Screen
        cursor*: int
        active*: Menu
        root*: Menu

    Menu* = ref object
        name*: string
        effect*: proc(self: var Menu, game: Game)
        children*: seq[Menu]
        parent*: Menu


func state*(self: CombatScreen): CombatState {.inline.} = self.privateState

func setState*(self: var CombatScreen, state: CombatState) {.inline.} =
    alias activeChar: self.turnOrder[self.turn]
    self.menuCursor = 0
    self.mapCursor = activeChar.currentTile
    self.privateState = state
    self.tempMessage = ""

func abilityTargetCharacter*(target: Character): AbilityTarget =
    AbilityTarget(kind: TargetCharacter, character: target)

func abilityTargetTile*(target: Vec2): AbilityTarget =
    AbilityTarget(kind: TargetTile, tile: target)

func abilityTargetNone*() : AbilityTarget =
    AbilityTarget(kind: TargetNone)


# Can't be in weapon_definitions b/c of circular import
let NONE_WEAPON* = Weapon(
    name: "Hands",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 1,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: 1,
        handedness: Handed.single
    )
)

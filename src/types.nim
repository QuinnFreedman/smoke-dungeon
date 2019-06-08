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
        shadowMask1*: Matrix[bool]
        shadowMask2*: Matrix[bool]
        seen*: Matrix[bool]
        entrance*: Vec2
        exit*: Vec2
        collision*: proc (pos: Vec2): bool
        dynamicEntities*: Matrix[Character]

    Inventory* = object
        curBackpack*: int
        curX*, curY*, curI*: int
        cursorInSidePane*, cursorInTopRow*: bool
        activeCharacter*: int
        inMenu*: bool
        menuCursor*: int
        menuSubject*: Item
        ground*: Matrix[Item]

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
        path*: seq[Vec2]
        message*: string
        aoeAuras*: Matrix[AoeAura]

    CombatTransitionScreen* = object
        startWindow*: Rect
        endWindow*: Rect
        timeElapsed*: float
        whenDone*: ScreenChange

    CombatState* {.pure.} = enum
        waitingMovementAnimation,
        pickingMovement,
        pickingAbility,
        pickingTarget,
        waitingAttackAnimation


    # **************************
    #          Items
    # **************************

    ItemType* {.pure.} = enum clothing, weapon

    Item* = object
        name*: string
        icon*: TextureAlias
        case kind*: ItemType
        of ItemType.clothing: clothingInfo*: ClothingInfo
        of ItemType.weapon: weaponInfo*: WeaponInfo

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

    ClothingInfo* = object
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        slot*: ClothingSlot
        getStat*: proc(stat: Stat, baseValue: int): int

    ClothingSlot* {.pure.} = enum
        head, body, feet


    Stat* {.pure.} = enum
        maxHp,
        armor,
        magicResist,
        initiative,
        accuracy,
        dodge,
        strength,
        intelect,
        combatSpeed,
        backpackCapacity


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
        weapon*: Item

        ai*: AI
        following*: Character

        case kind*: CharacterType
        of humanoid:
            clothes*: array[ClothingSlot, Item]
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
        enemyTarget, allyTarget, aoe

    Ability* = object
        name*: string
        abilityRange*: float  # number of squares
        useWeaponRange*: bool # if true, ignore abilityRange and use the range of the weaoon the spell is channeled throug
        isMagical*: bool
        turnCost*: int
        case abilityType*: AbilityType:
        of aoe:
            aoePattern*: seq[Vec2]
            applyAoeEffect*: proc(caster: Character, target: Vec2,
                                  weaponInfo: WeaponInfo,
                                  combat: var CombatScreen)
        else:
            discard
        isValidCaster*: proc(caster: Character): bool
        isValidTarget*: proc(caster: Character,
                             target: AbilityTarget,
                             weaponInfo: WeaponInfo): bool
        applyEffect*: proc(caster, target: Character, weaponInfo: WeaponInfo)

    AbilityTargetType* = enum TargetCharacter, TargetTile
    AbilityTarget* = object
        case kind*: AbilityTargetType
        of TargetCharacter:
            character*: Character
        of TargetTile:
            tile*: Vec2

    DamageType* {.pure.} = enum physical, magical, trueDamage


    AI* = tuple[
        worldMovement: proc(self: Character,
                            others: seq[Character],
                            level: var Level),
        combatMovement: proc(self: Character,
                             allies, enemies: seq[Character],
                             level: var Level): seq[Vec2],
        chooseAttack: proc(self: Character,
                           allies, enemies: seq[Character],
                           level: Level): (Ability, AbilityTarget)
    ]

    AoeAura* = object
        turns*: int
        caster*: Character
        texture*: TextureAlias
        effect*: proc(character: Character)

    Aura* = object
        turns*: int
        icon*: TextureAlias
        getStat*: proc(stat: Stat, currentValue: int): int
        effect*: proc(character: Character)

    ScreenChange* = object
        case changeTo*: Screen
        of Screen.combat:
            playerParty*, enemyParty*: seq[Character]
        of Screen.transition:
            startWindow*, endWindow*: Rect
            whenDone*: ref ScreenChange
        of Screen.inventory:
            items*: seq[Item]
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
    self.message = ""

func abilityTargetCharacter*(target: Character): AbilityTarget =
    AbilityTarget(kind: TargetCharacter, character: target)

func abilityTargetTile*(target: Vec2): AbilityTarget =
    AbilityTarget(kind: TargetTile, tile: target)

# Can't be in weapon_definitions b/c of circular import
let NONE_WEAPON* = Item(
    kind: ItemType.weapon,
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

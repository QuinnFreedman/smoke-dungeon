import
    sdl2,
    sdl2.ttf

import
    matrix,
    direction,
    vector,
    render_utils,
    textures,
    keyboard,
    utils


type
    Screen* = enum none, world, inventory, combat

    Game* = ref object
        shouldQuit*: bool
        keyboard*: Keyboard
        renderInfo*: RenderInfo
        screen*: Screen
        inventory*: Inventory
        combat*: CombatScreen
        gameState*: GameState

    GameState* = object
        level*: Level
        playerParty*: seq[Character]
        entities*: seq[Character]

    Level* = object
        walls*: Matrix[bool]
        collision*: Matrix[uint8]
        textures*: Matrix[sdl2.Rect]

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
        activeWeapon*: Item
        activeAbility*: Ability
        activeTarget*: AbilityTarget
        movementStart*: Vec2
        mapCursor*: Vec2
        menuCursor*: int
        path*: seq[Vec2]
        message*: string
        aoeAuras*: Matrix[AoeAura]


    CombatState* {.pure.} = enum
        waitingMovementAnimation,
        pickingMovement,
        pickingAbility,
        pickingWeapon,
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

    ClothingSlot* {.pure.} = enum
        head, body, feet



    # **************************
    #         Characters
    # **************************

    CharacterType* {.pure.} = enum humanoid, animal

    Character* = ref object
        currentTile*: Vec2
        nextTile*: Vec2
        actualPos*: Vec2f
        facing*: Direction
        speed*: float
        race*: Race
        sex*: Sex
        backpack*: Matrix[Item]
        spritesheet*: TextureAlias
        class*: Class
        health*: int
        mana*: int
        energy*: int
        maxHealth*: int
        maxMana*: int
        maxEnergy*: int
        auras*: seq[Aura]

        ai*: AI
        following*: Character

        case kind*: CharacterType
        of humanoid:
            clothes*: array[ClothingSlot, Item]
            leftHand*: Item
            rightHand*: Item
        of animal: discard

    Class* = object
        name*: string
        startingHealth*: int
        startingEnergy*: int
        startingMana*: int

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
        abilityRange*: float #number of squares
        useWeaponRange*: bool #if true, ignore abilityRange and use the range of the weaoon the spell is channeled throug
        energyCost*: int
        manaCost*: int
        healthCost*: int
        case abilityType*: AbilityType:
        of aoe:
            aoePattern*: seq[Vec2]
            applyAoeEffect*: proc(caster: Character, target: Vec2, weapon: Item,
                                  combat: var CombatScreen)
        else:
            discard
        applyEffect*: proc(caster, target: Character, weapon: Item)

    AbilityTargetType* = enum TargetCharacter, TargetTile
    AbilityTarget* = object
        case kind*: AbilityTargetType
        of TargetCharacter:
            character*: Character
        of TargetTile:
            tile*: Vec2


    AI* = tuple[
        worldMovement: proc(self: Character,
                            others: seq[Character],
                            level: var Level),
        combatMovement: proc(self: Character,
                             allies, enemies: seq[Character],
                             level: var Level): seq[Vec2],
        chooseAttack: proc(self: Character,
                           allies, enemies: seq[Character],
                           level: Level): (Ability, Item, AbilityTarget)
    ]

    AoeAura* = object
        turns*: int
        caster*: Character
        texture*: TextureAlias
        effect*: proc(character: Character)

    Aura* = object
        turns*: int
        icon*: TextureAlias
        effect*: proc(character: Character)

    ScreenChange* = object
        case changeTo*: Screen
        of Screen.combat:
            playerParty*, enemyParty*: seq[Character]
        of Screen.inventory:
            items*: seq[Item]
        of Screen.world:
            discard
        of Screen.none:
            discard





proc state*(self: CombatScreen): CombatState {.inline.} = self.privateState

proc setState*(self: var CombatScreen, state: CombatState) {.inline.} =
    alias activeChar: self.turnOrder[self.turn]
    self.menuCursor = 0
    self.mapCursor = activeChar.currentTile
    self.privateState = state
    self.message = nil

proc abilityTargetCharacter*(target: Character): AbilityTarget =
    AbilityTarget(kind: TargetCharacter, character: target)

proc abilityTargetTile*(target: Vec2): AbilityTarget =
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

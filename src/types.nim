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

# **************************
#         Items
# **************************

type
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

    Handed* {.pure.} = enum single, double

    ClothingInfo* = object
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        slot*: ClothingSlot

    ClothingSlot* {.pure.} = enum
        head, body, feet


type
    Screen* {.pure.} = enum world, inventory, combat

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

    CombatScreen* = object
        playerParty*: seq[Character]
        enemyParty*: seq[Character]
        turnOrder*: seq[Character]
        center*: Vec2
        privateState: CombatState
        turn*: int
        activeWeapon*: Item
        activeAbility*: Ability
        activeTarget*: Character
        movementStart*: Vec2
        mapCursor*: Vec2
        menuCursor*: int
        path*: seq[Vec2]
        message*: string

    CombatState* {.pure.} = enum
        waitingMovementAnimation,
        pickingMovement,
        pickingAbility,
        pickingWeapon,
        pickingTarget,
        waitingAttackAnimation


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

    Ability* = object
        name*: string
        abilityRange*: float #number of squares
        useWeaponRange*: bool #if true, ignore abilityRange and use the range of the weaoon the spell is channeled throug
        abilityType*: AbilityType #TODO add required fields for AOE spells
        energyCost*: int
        manaCost*: int
        healthCost*: int
        applyEffect*: proc(caster, target: var Character, weapon: Item)

    AbilityType* {.pure.} = enum
        enemyTarget, allyTarget, aoe

    AI* = tuple[
        worldMovement: proc(self: Character,
                            others: seq[Character],
                            level: var Level),
        combatMovement: proc(self: Character,
                             allies, enemies: seq[Character],
                             level: var Level): seq[Vec2],
        chooseAttack: proc(self: Character,
                           allies, enemies: seq[Character],
                           level: Level): (Ability, Item, Character)
    ]




proc state*(self: CombatScreen): CombatState {.inline.} = self.privateState

proc setState*(self: var CombatScreen, state: CombatState) {.inline.} =
    alias activeChar: self.turnOrder[self.turn]
    self.menuCursor = 0
    self.mapCursor = activeChar.currentTile
    self.privateState = state
    self.message = nil

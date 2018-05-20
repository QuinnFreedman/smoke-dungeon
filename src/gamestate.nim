import
    sdl2,
    sdl2.ttf,
    random,
    times,
    strutils,
    sequtils

import
    matrix,
    character,
    direction,
    vector,
    textures,
    dungeon_generation,
    item,
    clothing_definitions,
    weapon_definitions,
    utils,
    simple_types,
    level,
    render_utils,
    ability

type
    Input* {.pure.} = enum none, left, right, up, down, tab, enter

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
        state*: CombatState
        turn*: int
        activeWeapon*: Item
        activeAbility*: Ability
        mapCursor*: Vec2
        menuCursor*: int
        path*: seq[Vec2]
        message*: string

    CombatState* {.pure.} = enum
        waiting,
        pickingMovement,
        pickingAbility,
        pickingWeapon,
        pickingTarget

    Keyboard* = object
        inputs: array[Input, bool]
        inputsSinceLastFrame: array[Input, bool]


proc width*(self: Level): int {.inline.} =
    self.walls.width

proc height*(self: Level): int {.inline.} =
    self.walls.height

proc renderer*(self: Game): RendererPtr {.inline.} =
    self.renderInfo.renderer


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    if keyDown and not self.keyboard.inputs[input]:
        self.keyboard.inputsSinceLastFrame[input] = true
    self.keyboard.inputs[input] = keyDown


proc keyDown*(self: Keyboard, key: Input): bool {.inline.} =
    self.inputs[key]


proc keyPressed*(self: Keyboard, key: Input): bool {.inline.} =
    self.inputsSinceLastFrame[key]


proc keyDown*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.inputs[key]


proc keyPressed*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.inputsSinceLastFrame[key]


proc resetInputs*(self: Game) =
    self.keyboard.inputsSinceLastFrame.zero()


proc initGameData*(renderer: RendererPtr, font: FontPtr): Game =
    new result
    result.renderInfo = RenderInfo(
        renderer: renderer,
        font: font,
        textCache: newTextCache()
    )

    let seed = int64(epochTime())
    # let seed = int64(1524099821)

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerParty = newSeq[Character]()

    var playerCharacter = newCharacter(
        v(levelWidth div 2, levelHeight div 2), 2, Race.human, Sex.male)

    playerCharacter.clothes[ClothingSlot. head] = MAGE_HOOD
    playerCharacter.clothes[ClothingSlot.body] = KNIGHT_CHESTPLATE
    playerCharacter.clothes[ClothingSlot.feet] = KNIGHT_GRIEVES
    playerCharacter.backpack[0, 0] = KNIGHT_HELMET
    playerCharacter.backpack[1, 0] = MAGE_CLOAK
    playerCharacter.backpack[3, 1] = MAGE_SHOES
    playerCharacter.backpack[2, 1] = IRON_SHORTSWORD
    result.gameState.playerParty.add(playerCharacter)

    var companion1 = newCharacter(
        v(levelWidth div 2 + 1, levelHeight div 2), 2, Race.human, Sex.male)
    companion1.backpack[1, 0] = KNIGHT_HELMET
    companion1.ai = AI.follow
    companion1.following = playerCharacter
    result.gameState.playerParty.add(companion1)

    var spider = newCharacter(
        v(levelWidth div 2, levelHeight div 2 - 1), 2, Race.spider, Sex.male)
    spider.ai = AI.random
    spider.kind = CharacterType.animal

    result.gameState.entities = concat(result.gameState.playerParty)
    result.gameState.entities.add(spider)

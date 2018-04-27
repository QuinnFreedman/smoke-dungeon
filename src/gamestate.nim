import
    sdl2,
    random,
    times,
    strutils

import
    matrix,
    character,
    direction,
    vector,
    textures,
    dungeon_generation,
    clothing,
    utils,
    simple_types

type
    Input* {.pure.} = enum none, left, right, up, down, tab, enter

    Screen* {.pure.} = enum world, inventory

    Inventory* = object
        curBackpack*: int
        curX*, curY*, curI*: int
        cursorInSidePane*, cursorInTopRow*: bool
        activeCharacter*: int

    Game* = ref object
        shouldQuit*: bool
        inputs*: array[Input, bool]
        inputsSinceLastFrame: array[Input, bool]
        renderer*: RendererPtr
        screen*: Screen
        inventory*: Inventory
        gameState*: GameState

    GameState* = object
        level*: Level
        playerParty*: array[4, Character]


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    if keyDown and not self.inputs[input]:
        self.inputsSinceLastFrame[input] = true
    self.inputs[input] = keyDown
    

proc keyDown*(self: Game, key: Input): bool {.inline.} = 
    self.inputs[key]


proc keyPressed*(self: Game, key: Input): bool {.inline.} = 
    self.inputsSinceLastFrame[key]


proc resetInputs*(self: Game) =
    self.inputsSinceLastFrame.zero()


proc initGameData*(renderer: RendererPtr): Game =
    new result
    result.renderer = renderer

    let seed = int64(epochTime())
    # let seed = int64(1524099821)

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    var playerCharacter = newCharacter(
        v(levelWidth div 2, levelHeight div 2), 2, Race.human, Sex.male)

    playerCharacter.clothes[ClothingSlot. head] = MAGE_HOOD
    playerCharacter.clothes[ClothingSlot.body] = KNIGHT_CHESTPLATE
    playerCharacter.clothes[ClothingSlot.feet] = KNIGHT_GRIEVES
    playerCharacter.backpack[0, 0] = KNIGHT_HELMET
    playerCharacter.backpack[1, 0] = MAGE_CLOAK
    playerCharacter.backpack[3, 1] = MAGE_SHOES
    result.gameState.playerParty[0] = playerCharacter

    var companion1 = newCharacter(
        v(levelWidth div 2 + 1, levelHeight div 2), 2, Race.human, Sex.male)
    companion1.backpack[1, 0] = KNIGHT_HELMET
    result.gameState.playerParty[1] = companion1

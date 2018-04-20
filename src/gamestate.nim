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
    utils

type
    Input* {.pure.} = enum none, left, right, up, down, tab

    Game* = ref object
        shouldQuit*: bool
        inputs*: array[Input, bool]
        inputsSinceLastFrame: array[Input, bool]
        renderer*: RendererPtr
        gameState*: GameState

    GameState* = object
        level*: Level
        playerCharacter*: Character


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    if keyDown and not self.inputs[input]:
        self.inputsSinceLastFrame[input] = true
    self.inputs[input] = keyDown
    

proc keyDown*(self: Game, key: Input): bool {.inline.} = 
    self.inputs[key]


proc keyPressed*(self: Game, key: Input): bool {.inline.} = 
    self.inputsSinceLastFrame[key]


proc initGameData*(renderer: RendererPtr): Game =
    new result
    result.renderer = renderer

    # let seed = int64(epochTime())
    let seed = int64(1524099821)

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerCharacter = newCharacter(
        v(levelWidth div 2, levelHeight div 2), 2, Race.human, Sex.male)

    result.gameState.playerCharacter.clothes[ClothingSlot.head] = MAGE_HOOD


proc loop*(self: var Game, dt: float) =
    if self.keyDown(Input.up):
        self.gameState.playerCharacter.move(Direction.up,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.down):
        self.gameState.playerCharacter.move(Direction.down,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.left):
        self.gameState.playerCharacter.move(Direction.left,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.right):
        self.gameState.playerCharacter.move(Direction.right,
                                            self.gamestate.level.walls)
        
    self.gameState.playerCharacter.update(dt)

    self.inputsSinceLastFrame.zero()
    

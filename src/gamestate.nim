import
    sdl2,
    random,
    times,
    strutils

import matrix,
       character,
       direction,
       vector,
       textures
       
type
    Input* {.pure.} = enum none, left, right, up, down, quit

    Game* = ref object
        inputs*: array[Input, bool]
        renderer*: RendererPtr
        gameState*: GameState

    GameState* = object
        mapTextures*: Matrix[sdl2.Rect]
        walls*: Matrix[bool]
        playerCharacter*: Character


proc initGamestate(rng: var Rand): GameState =
    result.playerCharacter = newCharacter(v(0, 0), 1.5, Race.human, Sex.male)
    let levelWidth = 10
    let levelHeight = 10
    result.mapTextures = newMatrix[sdl2.Rect](levelWidth, levelHeight)
    result.walls = newMatrix[bool](levelWidth, levelHeight)
    for x, y in result.walls.indices:
        if bool(rng.rand(1)):
            result.walls[x, y] = true
            result.mapTextures[x, y] = STONE1
        else:
            result.mapTextures[x, y] = GRASS_LONG3


proc initGameData*(renderer: RendererPtr): Game =
    new result
    result.renderer = renderer
    let seed = int64(epochTime())
    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    result.gamestate = initGameState(rng)


proc loop*(self: var Game, dt: float) =
    if self.inputs[Input.up]:
        self.gameState.playerCharacter.move(Direction.up,
                                            self.gamestate.walls)
    if self.inputs[Input.down]:
        self.gameState.playerCharacter.move(Direction.down,
                                            self.gamestate.walls)
    if self.inputs[Input.left]:
        self.gameState.playerCharacter.move(Direction.left,
                                            self.gamestate.walls)
    if self.inputs[Input.right]:
        self.gameState.playerCharacter.move(Direction.right,
                                            self.gamestate.walls)
        
    self.gameState.playerCharacter.update(dt)


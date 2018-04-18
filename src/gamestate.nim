import
    sdl2,
    random,
    times,
    strutils

import matrix,
       character,
       direction,
       vector,
       textures,
       dungeon_generation
       
type
    Input* {.pure.} = enum none, left, right, up, down, quit

    Game* = ref object
        inputs*: array[Input, bool]
        renderer*: RendererPtr
        gameState*: GameState

    GameState* = object
        level*: Level
        playerCharacter*: Character


proc initGameData*(renderer: RendererPtr): Game =
    new result
    result.renderer = renderer

    let seed = int64(epochTime())
    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerCharacter = newCharacter(
        v(levelWidth div 2, levelHeight div 2), 1.5, Race.human, Sex.male)

proc loop*(self: var Game, dt: float) =
    if self.inputs[Input.up]:
        self.gameState.playerCharacter.move(Direction.up,
                                            self.gamestate.level.walls)
    if self.inputs[Input.down]:
        self.gameState.playerCharacter.move(Direction.down,
                                            self.gamestate.level.walls)
    if self.inputs[Input.left]:
        self.gameState.playerCharacter.move(Direction.left,
                                            self.gamestate.level.walls)
    if self.inputs[Input.right]:
        self.gameState.playerCharacter.move(Direction.right,
                                            self.gamestate.level.walls)
        
    self.gameState.playerCharacter.update(dt)


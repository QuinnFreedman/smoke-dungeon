import sdl2 

import matrix,
       resources,
       character,
       direction,
       vector
       
type
    Input* {.pure.} = enum none, left, right, up, down, quit

    GameState* = object
        map*: Matrix[int]
        playerCharacter*: Character

    Game* = ref object
        inputs*: array[Input, bool]
        renderer*: RendererPtr
        gameState*: GameState
        resources*: GameResources


proc initGamestate*(): GameState =
    result.playerCharacter = newCharacter(v(0, 0), 1.5, Race.human, Sex.male)
    result.map = newMatrix[int](10, 10)


proc loop*(self: var Game, dt: float) =
    if self.inputs[Input.up]:
        self.gameState.playerCharacter.move(Direction.up)
    if self.inputs[Input.down]:
        self.gameState.playerCharacter.move(Direction.down)
    if self.inputs[Input.left]:
        self.gameState.playerCharacter.move(Direction.left)
    if self.inputs[Input.right]:
        self.gameState.playerCharacter.move(Direction.right)
        
    self.gameState.playerCharacter.update(dt)


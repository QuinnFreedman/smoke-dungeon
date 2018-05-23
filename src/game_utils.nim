import
    sdl2

import
    types,
    matrix,
    keyboard


proc width*(self: Level): int {.inline.} =
    self.walls.width

proc height*(self: Level): int {.inline.} =
    self.walls.height

proc renderer*(self: Game): RendererPtr {.inline.} =
    self.renderInfo.renderer


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    self.keyboard.handleInput(input, keyDown)


proc keyDown*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyDown(key)


proc keyPressed*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyPressed(key)


proc resetInputs*(self: Game) =
    self.keyboard.resetInputs()

import
    sdl2

import
    types,
    matrix,
    keyboard


func width*(self: Level): int {.inline.} =
    self.walls.width

func height*(self: Level): int {.inline.} =
    self.walls.height

func renderer*(self: Game): RendererPtr {.inline.} =
    self.renderInfo.renderer


func handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    self.keyboard.handleInput(input, keyDown)


func keyDown*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyDown(key)


func keyPressed*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyPressed(key)


func resetInputs*(self: Game) =
    self.keyboard.resetInputs()

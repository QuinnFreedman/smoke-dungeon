import utils

type
    Input* {.pure.} = enum none, left, right, up, down, tab, enter, back, menu, inspect

    Keyboard* = object
        inputs: array[Input, bool]
        inputsSinceLastFrame: array[Input, bool]

proc handleInput*(self: var Keyboard, input: Input, keyDown: bool) {.inline.} =
    if keyDown and not self.inputs[input]:
        self.inputsSinceLastFrame[input] = true
    self.inputs[input] = keyDown


proc keyDown*(self: Keyboard, key: Input): bool {.inline.} =
    self.inputs[key]


proc keyPressed*(self: Keyboard, key: Input): bool {.inline.} =
    self.inputsSinceLastFrame[key]

proc resetInputs*(self: var Keyboard) {.inline.} =
    self.inputsSinceLastFrame.zero()

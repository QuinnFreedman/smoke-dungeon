import sdl2

import matrix

type Level* = object
    walls*: Matrix[bool]
    collision*: Matrix[uint8]
    textures*: Matrix[sdl2.Rect]


proc newLevel*(width, height: int): Level =
    result.textures = newMatrix[sdl2.Rect](width, height)
    result.walls = newMatrix[bool](width, height)
    result.collision = newMatrix[uint8](width, height)

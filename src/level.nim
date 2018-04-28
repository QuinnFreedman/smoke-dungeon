import sdl2

import matrix

type Level* = object
    walls*: Matrix[bool]
    textures*: Matrix[sdl2.Rect]

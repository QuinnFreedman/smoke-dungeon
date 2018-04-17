import sdl2

proc newSdlRect*(x, y, w, h: int): Rect {.inline.} =
    rect(cint(x), cint(y), cint(w), cint(h))

proc newSdlSquare*(x, y, w: int): Rect {.inline.} =
    newSdlRect(x, y, w, w)

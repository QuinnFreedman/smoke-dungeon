import sdl2

import
    vector

proc newSdlRect*(x, y, w, h: int): Rect {.inline.} =
    rect(cint(x), cint(y), cint(w), cint(h))

proc newSdlSquare*(x, y, w: int): Rect {.inline.} =
    newSdlRect(x, y, w, w)


iterator iterRect*(self: Rect): Vec2 =
    let width = self.w
    let height = self.h
    for i in 0..<(width * height):
        let x = i mod width + self.x
        let y = i div width + self.y
        yield v(x, y)

proc zero*(a: var openArray[bool]) =
    for i in 0..<a.len:
        a[i] = false
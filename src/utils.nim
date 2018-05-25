import sdl2,
    math

import
    vector,
    direction

proc newSdlRect*(x, y, w, h: int): Rect {.inline.} =
    rect(cint(x), cint(y), cint(w), cint(h))

proc newSdlSquare*(x, y, w: int): Rect {.inline.} =
    newSdlRect(x, y, w, w)

proc clamp*(x, min, max: int): int {.inline.} =
    if x < min: min
    elif x > max: max
    else: x

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


proc directionTo*(f, t: Vec2): Direction =
    let delta = t - f
    if abs(delta.x) > abs(delta.y):
        if delta.x < 0: Direction.left
        else: Direction.right
    else:
        if delta.y < 0: Direction.up
        else: Direction.down

proc pop*[T](self: seq[T]): T =
    let lastIndex = self.len - 1
    result = self[lastIndex]
    self.delete(lastIndex, lastIndex)

proc `%%`*(a, b: int): int =
    (a + b) mod b

template doUntil*(a: untyped, b: typed): typed =
    while true:
        b
        if a:
            break

template alias*(a: untyped, b: typed) =
    template a: untyped = b

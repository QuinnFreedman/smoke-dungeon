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


proc zero*[T](a: var openArray[T]) =
    for i in 0..<a.len:
        a[i] = cast[T](0)


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


proc last*[T](a: openArray[T]): T =
    a[a.len - 1]

iterator flatten*[T](lists: varargs[seq[T]]): T =
    for l in lists:
        for x in l:
            yield x

proc makeRef*[T](thing: T): ref T =
    new result
    result[] = thing

proc boundedLerp*(x, a, b: float): float =
    let x1 = if x < 0: 0.0 elif x > 1: 1.0 else: x
    result = a + x1 * (b - a)

proc boundedLerp*(x: float, a, b: int): float =
    boundedLerp(x, a.float, b.float)

proc lerp*(progress: float, a, b: Vec2f): Vec2f =
    vecFloat(boundedLerp(progress, a.x, b.x),
             boundedLerp(progress, a.y, b.y))

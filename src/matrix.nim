import strutils

import vector

type Matrix*[T] = object
    width: int
    height: int
    offset: Vec2
    data: seq[T]

proc width*(self: Matrix): int {.inline.} =
    self.width
proc height*(self: Matrix): int {.inline.} =
    self.height

proc newMatrix*[T](width, height: int): Matrix[T] =
    result.width = width
    result.height = height
    result.data = newSeq[T](width * height)

proc newMatrixWithOffset*[T](width, height: int, offset: Vec2): Matrix[T] =
    result = newMatrix(width, height)
    result.offset = offset

proc get*[T](self: var Matrix[T], x, y: int): T =
    let x2 = x + self.offset.x
    let y2 = y + self.offset.y
    if x2 < 0 or x2 >= self.width:
        raise IndexError.newException(
            "x index: $1 out of bounds for matrix: $2".format(x2, self))
    if y2 < 0 or y2 >= self.height:
        raise IndexError.newException(
            "y index: $1 out of bounds for matrix: $2".format(y2, self))
    return self.data[y * self.width + x]

proc set*[T](self: var Matrix[T], x, y: int, value: T) =
    let x2 = x + self.offset.x
    let y2 = y + self.offset.y
    if x2 < 0 or x2 >= self.width:
        raise IndexError.newException(
            "x index: $1 out of bounds for matrix: $2".format(x2, self))
    if y2 < 0 or y2 >= self.height:
        raise IndexError.newException(
            "y index: $1 out of bounds for matrix: $2".format(y2, self))
    self.data[y * self.width + x] = value

proc `[]` *[T](self: var Matrix[T], x, y: int): T {.inline.} =
    self.get(x, y)

proc `[]` *[T](self: var Matrix[T], pos: Vec2): T {.inline.} =
    self.get(pos.x, pos.y)

proc `[]` *[T](self: Matrix[T], x, y: int): T {.inline.} =
    var mutSelf = self
    mutSelf.get(x, y)

proc `[]` *[T](self: Matrix[T], pos: Vec2): T {.inline.} =
    var mutSelf = self
    mutSelf.get(pos.x, pos.y)

proc `[]=` *[T](self: var Matrix[T], x, y: int, value: T) {.inline.} =
    self.set(x, y, value)

proc `[]=` *[T](self: var Matrix[T], pos: Vec2, value: T) {.inline.} =
    self.set(pos.x, pos.y, value)

proc contains*[T](self: var Matrix[T], vec: Vec2): bool =
    let x = vec.x + self.offset.x
    let y = vec.y + self.offset.y
    x >= 0 and x < self.width and y >= 0 and y < self.height

proc `$` *[T](self: Matrix[T]): string =
    "Matrix( width:$1, height:$2, offset:$3 )".format(
        self.width, self.height, self.offset)

#TODO add destructuring assignment to vectors so that this can return a vector
iterator indices*[T](self: Matrix[T]): (int, int) =
    let width = self.width
    let height = self.height
    for i in 0..<(width * height):
        let x = i mod width + self.offset.x
        let y = i div width + self.offset.y
        yield (x, y)
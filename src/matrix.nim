import strutils

import vector

func index[T](p: ptr T, i: int): ptr T =
    cast[ptr T](cast[int](p) + (i * sizeof(T)))

type Matrix*[T] = object
    width: int
    height: int
    offset: Vec2
    data: ptr T

func width*(self: Matrix): int {.inline.} =
    self.width
func height*(self: Matrix): int {.inline.} =
    self.height

proc newMatrix*[T](width, height: int): Matrix[T] =
    result.width = width
    result.height = height
    result.data = create(T, width * height)

proc newMatrixWithOffset*[T](width, height: int, offset: Vec2): Matrix[T] =
    result = newMatrix[T](width, height)
    result.offset = offset

proc matrixFromSeq*[T](data: seq[seq[T]]): Matrix[T] =
    result.height = data.len
    if result.height == 0:
        return
    result.width = data[0].len
    result.data = create(T, result.width * result.height)
    for y in 0..result.height - 1:
        let row = data[y]
        if row.len != result.width:
            raise ValueError.newException(
                "The first row had len $1 but row $2 had len $3"
                    .format(result.width, y, row.len)
            )
        for x in 0..result.width-1:
            result[x, y] = row[x]

proc recycle*[T](self: var Matrix[T], width, height: int, offset: Vec2) =
    if self.data.isNil:
        self.data = create(T, width * height)
    elif self.width == width and self.height == height:
        zeroMem(self.data, width * height * sizeof(T))
    else:
        dealloc self.data
        self.data = create(T, width * height)
    self.width = width
    self.height = height
    self.offset = offset

func setAll*[T](self: var Matrix[T], value: T) =
    for i in 0..<(self.width * self.height):
        self.data.index(i)[] = value

func get*[T](self: Matrix[T], x, y: int): T =
    let x2 = x - self.offset.x
    let y2 = y - self.offset.y
    if x2 < 0 or x2 >= self.width:
        raise IndexError.newException(
            "x index: $1 out of bounds for matrix: $2".format(x, self))
    if y2 < 0 or y2 >= self.height:
        raise IndexError.newException(
            "y index: $1 out of bounds for matrix: $2".format(y, self))
    return self.data.index(y2 * self.width + x2)[]

func set*[T](self: var Matrix[T], x, y: int, value: T) =
    let x2 = x - self.offset.x
    let y2 = y - self.offset.y
    if x2 < 0 or x2 >= self.width:
        raise IndexError.newException(
            "x index: $1 out of bounds for matrix: $2".format(x, self))
    if y2 < 0 or y2 >= self.height:
        raise IndexError.newException(
            "y index: $1 out of bounds for matrix: $2".format(y, self))
    self.data.index(y2 * self.width + x2)[] = value

func `[]` *[T](self: Matrix[T], x, y: int): T {.inline.} =
    self.get(x, y)

func `[]` *[T](self: Matrix[T], pos: Vec2): T {.inline.} =
    self.get(pos.x, pos.y)

func `[]=` *[T](self: var Matrix[T], x, y: int, value: T) {.inline.} =
    self.set(x, y, value)

func `[]=` *[T](self: var Matrix[T], pos: Vec2, value: T) {.inline.} =
    self.set(pos.x, pos.y, value)

func contains*[T](self: Matrix[T], vec: Vec2): bool =
    let x = vec.x - self.offset.x
    let y = vec.y - self.offset.y
    x >= 0 and x < self.width and y >= 0 and y < self.height

func inc*[T](self: var Matrix[T], v: Vec2) =
    self[v] = self[v] + 1

func dec*[T](self: var Matrix[T], v: Vec2) =
    self[v] = self[v] - 1


func `$` *[T](self: Matrix[T]): string =
    "Matrix( width:$1, height:$2, offset:$3 )".format(
        self.width, self.height, self.offset)

#TODO add destructuring assignment to vectors so that this can return a vector
iterator indices*[T](self: Matrix[T]): Vec2 =
    let width = self.width
    let height = self.height
    for i in 0..<(width * height):
        let x = i mod width + self.offset.x
        let y = i div width + self.offset.y
        yield (x, y)
#
# func unsafeGetAddr*[T](self: Matrix[T], x, y: int): ptr T =
#     let x2 = x - self.offset.x
#     let y2 = y - self.offset.y
#     if x2 < 0 or x2 >= self.width:
#         raise IndexError.newException(
#             "x index: $1 out of bounds for matrix: $2".format(x, self))
#     if y2 < 0 or y2 >= self.height:
#         raise IndexError.newException(
#             "y index: $1 out of bounds for matrix: $2".format(y, self))
#     return addr(self.data[y2 * self.width + x2])

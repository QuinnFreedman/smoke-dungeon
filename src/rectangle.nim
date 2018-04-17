import vector

type Rectangle* = object
    upperLeft: Vec2
    lowerRight: Vec2

proc newRectangle*(x, y, width, height: int): Rectangle =
    result.upperLeft = v(x, y)
    result.lowerRight = v(x + width, y + height)

proc upperLeft*(self: Rectangle): Vec2 {.inline.} = self.upperLeft
proc lowerRight*(self: Rectangle): Vec2 {.inline.} = self.lowerRight
proc lowerLeft*(self: Rectangle): Vec2 {.inline.} =
    result.x = self.upperLeft.x
    result.y = self.lowerRight.y
proc upperRight*(self: Rectangle): Vec2 {.inline.} =
    result.x = self.lowerRight.x
    result.y = self.upperLeft.y

proc x*(self: Rectangle): int {.inline.} = self.upperLeft.x
proc y*(self: Rectangle): int {.inline.} = self.upperLeft.y
proc width*(self: Rectangle): int {.inline.} =
    self.lowerRight.x - self.upperLeft.x
proc height*(self: Rectangle): int {.inline.} =
    self.lowerRight.y - self.upperLeft.y

proc forEach*(self: Rectangle, f: proc(x, y: int)) =
    var width = self.width
    var height = self.height
    var length = width * height
    for i in 0..length - 1:
        var y = i div width
        var x = i mod width
        f(x, y)

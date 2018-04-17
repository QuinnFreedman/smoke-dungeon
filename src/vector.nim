import strutils,
       math

type Vec2* = object
    x*: int
    y*: int

const ZERO* = Vec2(x: 0, y: 0)
const NE*  = Vec2( x:  1, y: -1 )
const E*   = Vec2( x:  1, y:  0 )
const SE*  = Vec2( x:  1, y:  1 )
const S*   = Vec2( x:  0, y:  1 )
const SW*  = Vec2( x: -1, y:  1 )
const W*   = Vec2( x: -1, y:  0 )
const NW*  = Vec2( x: -1, y: -1 )
const N*   = Vec2( x:  0, y: -1 )

const UP* = N
const DOWN* = S
const LEFT* = W
const RIGHT* = E

proc v*(x, y: int): Vec2 = Vec2(x: x, y : y)

proc `+` *(self, other: Vec2): Vec2 =
    result.x = self.x + other.x
    result.y = self.y + other.y

proc `+=` *(self: var Vec2, other: Vec2) =
    self.x += other.x
    self.y += other.y

proc `-` *(self, other: Vec2): Vec2 =
    result.x = self.x - other.x
    result.y = self.y - other.y

proc `-=` *(self: var Vec2, other: Vec2) =
    self.x -= other.x
    self.y -= other.y

proc `==` *(self, other: Vec2): bool =
    self.x == other.x and self.y == other.y

type Vec2f* = object
    x*: float
    y*: float

proc scale*(self: Vec2, scale: float): Vec2f =
    result.x = float(self.x) * scale
    result.y = float(self.y) * scale

proc round*(self: Vec2f): Vec2 =
    result.x = int(round(self.x))
    result.y = int(round(self.y))

proc `+` *(self, other: Vec2f): Vec2f =
    result.x = self.x + other.x
    result.y = self.y + other.y

proc `+=` *(self: var Vec2f, other: Vec2f) =
    self.x += other.x
    self.y += other.y

proc `-` *(self, other: Vec2f): Vec2f =
    result.x = self.x - other.x
    result.y = self.y - other.y

proc `-=` *(self: var Vec2f, other: Vec2f) =
    self.x -= other.x
    self.y -= other.y

proc `==` *(self, other: Vec2f): bool =
    self.x == other.x and self.y == other.y

proc vecFloat*(x, y: float): Vec2f =
    Vec2f(x: x, y: y)

proc vecFloat*(v: Vec2): Vec2f =
    Vec2f(x: float(v.x), y: float(v.y))
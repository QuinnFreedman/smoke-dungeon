import strutils,
       math

import direction

type Vec2* = tuple
    x: int
    y: int
const ZERO* =( x:  0, y:  0 )
const NE*  = ( x:  1, y: -1 )
const E*   = ( x:  1, y:  0 )
const SE*  = ( x:  1, y:  1 )
const S*   = ( x:  0, y:  1 )
const SW*  = ( x: -1, y:  1 )
const W*   = ( x: -1, y:  0 )
const NW*  = ( x: -1, y: -1 )
const N*   = ( x:  0, y: -1 )

const UP* = N
const DOWN* = S
const LEFT* = W
const RIGHT* = E

proc directionVector*(dir: Direction): Vec2 = 
    case dir
    of up: UP
    of down: DOWN
    of left: LEFT
    of right: RIGHT

proc v*(x, y: int): Vec2 = (x: x, y : y)

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

type Vec2f* = tuple
    x: float
    y: float

proc scale*(self: Vec2, scale: int): Vec2 =
    result.x = self.x * scale
    result.y = self.y * scale

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

proc scale*(self: Vec2f, scalar: float): Vec2f =
    result.x = self.x * scalar
    result.y = self.y * scalar

proc `==` *(self, other: Vec2f): bool =
    self.x == other.x and self.y == other.y

proc vecFloat*(x, y: float): Vec2f =
    (x: x, y: y)

proc vecFloat*(v: Vec2): Vec2f =
    (x: float(v.x), y: float(v.y))
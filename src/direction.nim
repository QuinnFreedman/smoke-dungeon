import random

type Direction* = enum
    up, down, left, right

func randomDirection*(rng: var Rand): Direction =
    Direction(rng.rand(3))

proc randomDirection*(): Direction =
    Direction(rand(3))

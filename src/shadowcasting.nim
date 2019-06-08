import
    vector,
    matrix

func getOctant(octant: int): (Vec2, Vec2) =
    case octant
    of 0: (vector.N,  vector.NE)
    of 1: (vector.NE, vector.E )
    of 2: (vector.E,  vector.SE)
    of 3: (vector.SE, vector.S )
    of 4: (vector.S,  vector.SW)
    of 5: (vector.SW, vector.W )
    of 6: (vector.W,  vector.NW)
    of 7: (vector.NW, vector.N )
    else: raise newException(ValueError, "octant > 7")

var debugNumMasked = 0

proc castOctant(octant: int,
                mask: var Matrix[bool],
                walls: Matrix[bool],
                pos: Vec2, inShadow: bool, radius: int) =
    let newRadius = if radius == 0: 0 else: radius - 1
    let octantVecs = getOctant(octant)
    for v in octantVecs.fields:
        let newPos = pos + v
        if mask.contains(newPos) and walls.contains(newPos):
            if inShadow or newRadius == 0:
                mask[newPos] = true
                inc debugNumMasked

            castOctant(octant, mask, walls, newPos, inShadow or walls[newPos], newRadius)

proc shadowCast*(heroPos: Vec2, mask: var Matrix[bool], walls: Matrix[bool], radius = -1) =
    debugNumMasked = 0
    mask[heroPos] = false
    for i in 0..<8:
        castOctant(i, mask, walls, heroPos, false, radius)

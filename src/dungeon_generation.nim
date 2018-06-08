import
    sdl2,
    random,
    math

import
    types,
    vector,
    matrix,
    textures,
    direction,
    utils

proc debugDrawDungeon(level: Level) =
    let textures = level.textures
    for y in 0..<textures.height:
        var line = ""
        for x in 0..<textures.width:
            let c: string =
                if v(x, y) == level.entrance:
                    " ^"
                elif v(x, y) == level.exit:
                    " v"
                elif textures[x, y]  == GRASS_LONG3:
                    " ."
                elif textures[x, y]  == STONE1:
                    " #"
                else:
                    "  "
            line = line & c
        echo line

proc weightedChoice[T, V](rng: var Rand,
        options: array[T, V], weights: array[T, float]): V =
    var totals: array[T, float]
    var running_total: float = 0

    for i, w in weights:
        running_total += w
        totals[i] = running_total

    let rnd = rng.rand(running_total)
    for i, total in totals:
        if rnd < total:
            return options[i]

proc generateLevel*(width, height: int, rng: var Rand): Level =
    result.walls = newMatrix[bool](width, height)
    result.walls.setAll(true)
    result.textures = newMatrix[sdl2.Rect](width, height)
    result.textures.setAll(BLACK)
    result.collision = newMatrix[uint8](width, height)

    var particle = v(0, height div 2)
    result.entrance = particle

    doUntil particle.x == result.walls.width - 1:
        result.walls[particle] = false
        result.textures[particle] = GRASS_LONG3
        for x in -1..1:
            for y in -1..1:
                let neighbor = v(particle.x + x, particle.y + y)
                if result.textures.contains(neighbor):
                    if result.textures[neighbor] == BLACK:
                        result.textures[neighbor] = STONE1

        var next: Vec2
        doUntil result.walls.contains(next):
            let randDirection = rng.weightedChoice(
                    [Direction.down, Direction.up, Direction.left, Direction.right],
                    [0.25, 0.25, 0.23, 0.27])
            next = particle + directionVector(randDirection)
        particle = next

    result.exit = particle

    for p in result.walls.indices:
        result.collision[p] = uint8(result.walls[p])

    debugDrawDungeon(result)

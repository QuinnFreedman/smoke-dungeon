import
    sdl2,
    random,
    math,
    random

import
    vector,
    matrix,
    textures,
    direction,
    level

proc generateLevel*(width, height: int, rng: var Rand): Level =
    result = newLevel(width, height)
    result.walls.setAll(true)
    result.textures.setAll(BLACK)

    var particle = v(width div 2, height div 2)

    for i in 0..1000:
        result.walls[particle] = false
        result.textures[particle] = GRASS_LONG3
        for x in -1..1:
            for y in -1..1:
                let neighbor = v(particle.x + x, particle.y + y)
                if result.textures.contains(neighbor):
                    if result.textures[neighbor] == BLACK:
                        result.textures[neighbor] = STONE1

        var next = particle + directionVector(randomDirection(rng))
        while not result.walls.contains(next):
            next = particle + directionVector(randomDirection(rng))
        particle = next


    for p in result.walls.indices:
        result.collision[p] = uint8(result.walls[p])


proc debugDrawDungeon(textures: Matrix[Rect]) =
    for y in 0..<textures.height:
        var line = ""
        for x in 0..<textures.width:
            let c: string =
                if textures[x, y]  == GRASS_LONG3:
                    " ."
                elif textures[x, y]  == STONE1:
                    " #"
                else:
                    "  "
            line = line & c
        echo line

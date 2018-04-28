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
    result.textures = newMatrix[sdl2.Rect](width, height)
    result.walls = newMatrix[bool](width, height)
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

    for y in 0..<result.textures.height:
        var line = ""
        for x in 0..<result.textures.width:
            let c: string =
                if result.textures[x, y]  == GRASS_LONG3:
                    " ."
                elif result.textures[x, y]  == STONE1:
                    " #"
                else:
                    "  "
            line = line & c
        echo line

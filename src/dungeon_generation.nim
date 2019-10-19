import
    sdl2,
    random

import
    astar,
    direction,
    matrix,
    textures,
    types,
    utils,
    vector

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
                elif textures[x, y] == GRASS_LONG3:
                    " ."
                elif textures[x, y] == STONE1:
                    " #"
                else:
                    "  "
            line = line & c
        echo line

func weightedChoice[T, V](rng: var Rand,
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

func getCollisionFunc(level: Level): (proc (v: Vec2): bool {.noSideEffect.}) =
    return func (v: Vec2): bool =
        not level.walls.contains(v) or
            level.walls[v] or
            not level.dynamicEntities[v].isNil

proc generateLevel*(width, height: int, rng: var Rand): Level =
    result.walls = newMatrix[bool](width, height)
    result.textures = newMatrix[sdl2.Rect](width, height)
    result.textures.setAll(BLACK)
    result.decals = newMatrix[TextureAlias](width, height)
    result.seen = newMatrix[bool](width, height)
    result.dynamicEntities = newMatrix[Character](width, height)
    result.collision = getCollisionFunc(result)
    result.walls.setAll(true)

    var particle = v(0, height div 2)
    result.entrance = particle

    doUntil particle.x == result.walls.width - 2:
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
                    [Direction.down, Direction.up, Direction.left,
                            Direction.right],
                    [0.25, 0.25, 0.23, 0.27])
            next = particle + directionVector(randDirection)
        particle = next

    result.exit = particle

    let level = result
    let collide = func (v: Vec2): bool = not level.walls.contains(v) or
            level.walls[v]
    let shortestPath = aStarSearch(
            collide,
            result.entrance, result.exit, false, addr(rng))

    for p in shortestPath:
        result.decals[p] = TextureAlias.footprint

    result.decals[result.entrance] = TextureAlias.footprint

    if false: debugDrawDungeon(result)

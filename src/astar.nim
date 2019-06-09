import
    binaryheap,
    tables,
    random

import
    vector,
    matrix,
    direction

func heuristic(a, b: Vec2): int =
    int(abs(a.x - b.x) + abs(a.y - b.y)) * 10


proc aStarSearch*(collision: proc (v: Vec2): bool, start, goal: Vec2, includeGoal: bool,
                  rng: ptr Rand): seq[Vec2] =
    var myRng =
        if rng.isNil:
            initRand(1)
        else:
            rng[]

    #TODO: don't alloc a new heap every time; just clear it
    var frontier = newHeap[(Vec2, int)] do (a, b: (Vec2, int)) -> int:
        if a[1] == b[1]: myRng.rand(2) - 1
        else: a[1] - b[1]

    frontier.push((start, 0))
    var cameFrom = initTable[Vec2, Vec2]()
    var costSoFar = initTable[Vec2, int]()
    cameFrom[start] = v(-1, -1)
    costSoFar[start] = 0

    while frontier.size != 0:
        let (current, _) = frontier.pop()

        if current == goal or
                (not includeGoal and distance(current, goal) == 1):
            result = newSeq[Vec2]()
            var parent = current
            while parent != v(-1, -1):
                result.add(parent)
                parent = cameFrom[parent]
            return

        var neighbors: array[4, Vec2]
        var numNeighbors = 0
        for dir in Direction.items:
            let neighbor = current + directionVector(dir)
            if not collision(neighbor):
                neighbors[numNeighbors] = neighbor
                numNeighbors += 1

        for i in 0..<numNeighbors:
            let next = neighbors[i]
            let newCost = costSoFar[current] # + 10 + myRng.rand(randomNoise)
            if not (next in costSoFar) or newCost < costSoFar[next]:
                costSoFar[next] = newCost
                let priority = newCost + heuristic(goal, next)
                frontier.push((next, priority))
                cameFrom[next] = current

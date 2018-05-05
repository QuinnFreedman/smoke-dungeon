import
    binaryheap,
    tables,
    random

import
    vector,
    matrix,
    direction

proc heuristic(a, b: Vec2): int =
    return int(abs(a.x - b.x) + abs(a.y - b.y)) * 10


proc aStarSearch*(collision: Matrix[bool], start, goal: Vec2,
                  randomize: int): seq[Vec2] =
    #TODO: don't alloc a new heap every time; just clear it
    var frontier = newHeap[(Vec2, int)]() do (a, b: (Vec2, int)) -> int:
        return a[1] - b[1]
    frontier.push((start, 0))
    var cameFrom = initTable[Vec2, Vec2]()
    var costSoFar = initTable[Vec2, int]()
    cameFrom[start] = v(-1, -1)
    costSoFar[start] = 0

    while frontier.size != 0:
        let (current, _) = frontier.pop()

        if current == goal:
            result = newSeq[Vec2]()
            var parent = current
            while parent != v(-1, -1):
                result.add(parent)
                parent = cameFrom[parent]

        var neighbors: array[4, Vec2]
        var numNeighbors = 0
        for dir in Direction.items:
            let neighbor = current + directionVector(dir)
            if collision.contains(neighbor) and not collision[neighbor]:
                neighbors[numNeighbors] = neighbor
                numNeighbors += 1

        for i in 0..<numNeighbors:
            let next = neighbors[i]
            let newCost = costSoFar[current] + 10 + rand(randomize)
            if not (next in costSoFar) or newCost < costSoFar[next]:
                costSoFar[next] = newCost
                let priority = newCost + heuristic(goal, next)
                frontier.push((next, priority))
                cameFrom[next] = current

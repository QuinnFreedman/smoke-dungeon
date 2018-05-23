import random

import
    types,
    astar,
    character_utils,
    direction

const AI_FOLLOW* =
    proc(self: Character, others: seq[Character], level: var Level) =
        if not self.following.isNil:
            let path = aStarSearch(level.walls, self.currentTile,
                                   self.following.nextTile, 3, nil)
            if path.len > 4:
                let nextTile = path[path.len - 2]
                self.moveToward(nextTile, level.collision)



const AI_RANDOM* =
    proc(self: Character, others: seq[Character], level: var Level) =
        if rand(60) < 1:
            # quick hack so that being near walls doesnt make you move less
            for _ in 0..10:
                self.move(randomDirection(), level.collision)

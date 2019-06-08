import random

import
    types,
    vector,
    astar,
    character_utils,
    direction,
    combat/combat_logic,
    ability_definitions,
    weapon_definitions

func getClosest(self: Character, others: seq[Character]): Character =
    var bestDistance: float = Inf
    for c in others:
        if c == self: continue
        if c.health <= 0: continue
        let distanceToC = distance(self.currentTile, c.currentTile)
        if distanceToC < bestDistance:
            bestDistance = distanceToC
            result = c


const AI_FOLLOW* =
    proc(self: Character, others: seq[Character], level: var Level) =
        if not self.following.isNil:
            let path = aStarSearch(level.collision, self.currentTile,
                                   self.following.nextTile,
                                   includeGoal=false,
                                   rng=nil)
            # let followDistance =
            #     if self.following.isMoving: 4
            #     else: 2
            if path.len > 3:
                let nextTile = path[path.len - 2]
                self.moveToward(nextTile, level)


const AI_RANDOM* =
    proc(self: Character, others: seq[Character], level: var Level) =
        if rand(60) < 1:
            # quick hack so that being near walls doesnt make you move less
            for _ in 0..10:
                self.move(randomDirection(), level)


const AI_COMBAT_MOVE_NEAREST_ENEMY* =
    proc(self: Character, allies, enemies: seq[Character],
         level: var Level): seq[Vec2] =
        let closestEnemy = getClosest(self, enemies)
        if not closestEnemy.isNil:
            result = aStarSearch(level.collision, self.currentTile,
                                 closestEnemy.currentTile,
                                 includeGoal=false,
                                 rng=nil)

const AI_COMBAT_ATTACK_NEAREST_ENEMY* =
    proc(self: Character, allies, enemies: seq[Character],
         level: Level): (Ability, AbilityTarget) =
        let closestEnemy = getClosest(self, enemies)
        if not closestEnemy.isNil:
            let target = abilityTargetCharacter(closestEnemy)
            let ability = BASIC_ATTACK
            if validateTarget(caster=self,
                              target=target,
                              allies=allies,
                              ability=ability)[0]:
                return (BASIC_ATTACK, target)

        return (NONE_ABILITY, abilityTargetCharacter(nil))

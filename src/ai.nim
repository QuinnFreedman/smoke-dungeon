import
    random,
    sugar


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

type CombatAiFunction = proc(self: Character, allies, enemies: seq[Character],
         level: Level): (Ability, TargetIntention)


func combatAi(f: CombatAiFunction): CombatAiFunction = f


let AI_COMBAT_DO_NOTHING* = combatAi(
    (self, allies, enemies, level) => 
        (NONE_ABILITY, TargetIntention(abilityType: untargeted))
)

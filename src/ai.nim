import
    random,
    sugar


import
    ability_definitions,
    astar,
    character_utils,
    combat/combat_logic,
    combat/combat_utils,
    direction,
    types,
    utils,
    vector,
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

type CombatAiFunction = proc(self: Character, combat: CombatScreen,
         level: Level): (Ability, TargetIntention)


func combatAi(f: CombatAiFunction): CombatAiFunction = f

let AI_COMBAT_DO_NOTHING* = combatAi(
    (self, combat, level) => 
        (NONE_ABILITY, TargetIntention(abilityType: untargeted))
)

iterator getRangedMovementOptions(combat: CombatScreen, level: Level,
                                  ability: Ability): (int, Vec2) =
    assert ability.abilityType == AbilityType.ranged
    let activeCharPos = combat.turnOrder[combat.turn].currentTile
    let paths = expandMovementPattern(activeCharPos, ability.movementPattern)
    for i, path in paths:
        if movementPathIsValid(combat, level, path, ability.canJump):
            yield (i, path.last)

iterator getRangedProjectileOptions(combat: CombatScreen, level: Level,
                                    ability: Ability, position: Vec2): (int, Vec2) =
    assert ability.abilityType == AbilityType.ranged
    let paths = expandMovementPattern(position, ability.projectilePattern)
    for i, path in paths:
        yield (i, path.last)


proc walkingDistance(level: Level, fromTile, toTile: Vec2): int =
    echo "calculate walking distance:"
    dump((level, fromTile, toTile))
    let path = aStarSearch(level.collision, fromTile, toTile,
                           includeGoal=false, rng=nil)
    dump(path)
    if path.len > 0:
        return path.len
    else:
        return -1


let DO_NOTHING = (NONE_ABILITY, targetIntentionNone())

proc AI_COMBAT_SPIDER*(self: Character, combat: CombatScreen,
        level: Level): (Ability, TargetIntention) =
    # pick ability (always the first one)
    var ability: Ability
    for a in self.iterAbilities():
        ability = a
        break

    # pick movement (move towards nearest enemy)
    let nearestEnemy = self.getClosest(combat.getEnemies())
    var movementChoice = -1
    var movementLocation: Vec2
    var bestDistance = high(int)
    for (i, location) in getRangedMovementOptions(combat, level, ability):
        let distanceToNearestEnemy = 
                level.walkingDistance(location, nearestEnemy.currentTile)
        echo $i & ": " & $distanceToNearestEnemy
        if distanceToNearestEnemy >= 0 and distanceToNearestEnemy < bestDistance:
            movementChoice = i
            movementLocation = location

    if movementChoice == -1:
        return DO_NOTHING

    # pick projectile target (pick any option that will hit an enemy)
    var projectileChoice = -1
    for (i, location) in getRangedProjectileOptions(combat, level, ability, movementLocation):
        if combat.getCharacterAtTile(location).isNotNil or projectileChoice == -1:
            projectileChoice = i

    # return target
    return (ability, targetIntentionRanged(movementChoice, projectileChoice))

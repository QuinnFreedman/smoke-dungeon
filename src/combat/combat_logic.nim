import
    math,
    patty,
    sugar

import
    ../ability_definitions,
    ../ability_utils,
    ../character_utils,
    ../constants,
    ../direction,
    ../keyboard,
    ../matrix,
    ../types,
    ../utils,
    ../vector,
    combat_utils


func getCharacterAtTile*(combat: CombatScreen, v: Vec2): Character =
    for c in combat.turnOrder:
        if c.currentTile == v:
            return c
    return nil


func movementPathIsValid*(combat: CombatScreen,
                          level: Level,
                          path: seq[Vec2],
                          canJump: bool): bool =
    let window = getCombatWindow(combat)
    let last = path.last
    if not window.containsPoint(last) or not level.walls.contains(last):
        return false

    if level.collision(last):
        return false

    for v in path:
        if not window.containsPoint(v) or not level.walls.contains(v):
            return false

        if level.collision(v) and not canJump:
            return false

    return true


proc validateTargetIntention*(
        combat: CombatScreen,
        level: Level,
        ability: Ability,
        target: TargetIntention,
    ): (bool, string) =
    let activeChar = combat.turnOrder[combat.turn]
    let characterPosBeforeMovement = combat.movementStart

    if not activeChar.canCast(ability):
        return (false, "Can't cast that")

    if target.abilityType != ability.abilityType:
        return (false, "Internal Error: ability types don't match")

    case ability.abilityType
    of dash:
        TODO("Validate dash")
        return (false, "TODO validate dash")
    of targeted:
        TODO("Validate targeted")
        return (false, "TODO validate targeted")
    of ranged:
        let movementPath = expandMovementPattern(
                characterPosBeforeMovement,
                ability.projectilePattern)
        if target.movementPathIndex < 0 or
            target.movementPathIndex >= movementPath.len:
            return (false, "Movement index out of bounds.")

        let path = movementPath[target.movementPathIndex]
        if not movementPathIsValid(combat, level, path, ability.canJump):
            return (false, "Can't move there")

        # call getTargetFromIntention and validate target if it should be
        # possible to have invalid projectile paths.

        return (true, "")
    of untargeted:
        return (true, "")

    # if not ability.isValidTarget.isNil and
    #         not ability.isValidTarget(activeChar, target):
    #     return (false, "Invalid target")

    return (true, "")


func numAlive(combat: CombatScreen): (int, int) =
    var numAllies, numEnemies = 0
    for c in combat.turnOrder:
        if c.health > 0:
            if c in combat.playerParty:
                inc(numAllies)
            elif c in combat.enemyParty:
                inc(numEnemies)
    return (numAllies, numEnemies)


func getTargetFromIntention(combat: CombatScreen,
                            level: Level,
                            ability: Ability,
                            target: TargetIntention): AbilityTarget =
    assert target.abilityType == ability.abilityType
    let activeChar = combat.turnOrder[combat.turn]
    case ability.abilityType
    of AbilityType.ranged:
        let movementOptions = expandMovementPattern(combat.movementStart,
                                                    ability.movementPattern)
        let characterPosAfterMovement =
            movementOptions[target.movementPathIndex].last

        let projectilePaths = expandMovementPattern(characterPosAfterMovement,
                                                    ability.projectilePattern)
        let window = getCombatWindow(combat)
        let path = projectilePaths[target.projectilePathIndex]
        for v in path:
            if not window.containsPoint(v) or not level.walls.contains(v):
                return abilityTargetNone()

            if level.walls[v]:
                return abilityTargetTile(v)

            let hit = level.dynamicEntities[v]
            if not hit.isNil:
                if ability.hasFriendlyFire:
                    return abilityTargetCharacter(hit)

                let isPlayerCharacter = activeChar in combat.playerParty
                let opponentParty =
                    if isPlayerCharacter:
                        combat.enemyParty
                    else:
                        combat.playerParty

                if hit in opponentParty:
                    return abilityTargetCharacter(hit)
    of AbilityType.targeted:
        let v = target.target
        let hit = level.dynamicEntities[v]
        if hit.isNil:
            return abilityTargetNone()

        return abilityTargetCharacter(hit)

    else:
        # TODO: implement other ability types
        return abilityTargetNone()


func getTargetAtCursor(combat: CombatScreen,
                       level: Level,
                       ability: Ability): AbilityTarget =
    let intention =
        case ability.abilityType
        of untargeted:
            TargetIntention(
                abilityType: untargeted
            )
        of ranged:
            TargetIntention(
                abilityType: AbilityType.ranged,
                movementPathIndex: combat.rangedAbilityMovementPathIndex,
                projectilePathIndex: combat.menuCursor
            )
        of targeted:
            TargetIntention(
                abilityType: AbilityType.targeted,
                target: combat.mapCursor
            )
        else:
            TODO("Implement getTargetAtCursor for other ability types")
            TargetIntention(abilityType: untargeted)
    return getTargetFromIntention(combat, level, ability, intention)

proc doAttack(combat: var CombatScreen,
               level: var Level) =
    alias activeChar: combat.turnOrder[combat.turn]
    if activeChar in combat.enemyParty:
        let (ability, target) = activeChar.ai.chooseAttack(
                activeChar, combat, level
        )
        assert target.abilityType == ability.abilityType
        match target:
            targeted(target: _):
                # target*: Vec2
                TODO("AI targeted")
                discard
            dash(pathIndex: _):
                # pathIndex*: int
                TODO("AI dash")
                discard
            ranged(movementPathIndex: moveIdx, projectilePathIndex: _):
                let movementOptions = expandMovementPattern(
                    activeChar.currentTile, ability.movementPattern)
                let moveTo = movementOptions[moveIdx].last
                # TODO fix facing direction
                activeChar.teleport(moveTo, Direction.down, level)
            untargeted:
                discard
        let (valid, reason) = validateTargetIntention(combat, level, ability, target)
        if valid:
            combat.activeAbility = ability
        else:
            echo "AI picked invalid move. MESSAGE: \"" & reason & "\""
            combat.activeAbility = NONE_ABILITY
    else:
        assert activeChar in combat.playerParty

    let ability = combat.activeAbility
    let hit = getTargetAtCursor(combat, level, ability)
    let weapon = activeChar.getWeaponInfo
    combat.activeTarget = hit
    match hit:
        TargetCharacter(character: target):
            if ability.applyEffect.isNil:
                echo "WARNING: the ability \"" & ability.name & "\" has no effect function so it will be skipped."
            else:
                # TODO figure out if the ability hits (is dodged)
                let message = ability.applyEffect(activeChar, target, weapon)
                if message == "":
                    combat.log("The " & describe(activeChar) & " hits the" &
                            describe(target) & "!", true)


        TargetTile(tile: _):
            combat.log("You hit a wall", true)

        TargetNone:
            combat.log("Untargeted ability. doing nothing for now", true)

    combat.setState(CombatState.playingAinimation)


func tickAoeAuras(combat: var CombatScreen, caster: Character) =
    # tick auras
    for p in combat.aoeAuras.indices:
        var aura = combat.aoeAuras[p]
        if not aura.isNone and aura.caster == caster:
            if aura.turns == 1:
                combat.aoeAuras[p] = AoeAura()
            else:
                combat.aoeAuras[p] = AoeAura(
                    turns: aura.turns - 1,
                    caster: aura.caster,
                    texture: aura.texture,
                    effect: aura.effect
                )


proc goToNextTurn*(combat: var CombatScreen, level: var Level): ScreenChange =
    alias activeChar: combat.turnOrder[combat.turn]

    echo "turn end: " & $activeChar
    echo " -- next turn ---------------------"

    # Check if anyone is still alive
    let (numAllies, numEnemies) = combat.numAlive
    if numEnemies == 0 or numAllies == 0:
        return ScreenChange(changeTo: Screen.world)

    # Skip unconcious characters
    doUntil activeChar.health > 0:
        combat.turn = (combat.turn + 1) mod combat.turnOrder.len
        if activeChar.health <= 0:
            tickAoeAuras(combat, activeChar)

    echo "turn start: " & $activeChar

    # apply aura effects
    for i in 0..<activeChar.auras.len:
        var aura = activeChar.auras[i]
        if not aura.effect.onTurnStart.isNil:
            aura.effect.onTurnStart(activeChar, level, combat)
        aura.turns -= 1

    # Apply aoe effects
    let aoeAura = combat.aoeAuras[activeChar.currentTile]
    if not aoeAura.isNone:
        aoeAura.effect(activeChar)

    # Decrement aoe aura turn counters
    tickAoeAuras(combat, activeChar)

    # go to the next character if the active character died from auras
    if activeChar.health <= 0:
        return goToNextTurn(combat, level)

    combat.movementStart = activeChar.currentTile
    combat.turnPointsRemaining = ABILITY_POINTS_PER_TURN
    combat.rangedAbilityMovementPathIndex = -1
    combat.animationTimer = 0

    # Do AI for enemy turn or ask user to pcik movement
    if activeChar in combat.enemyParty:
        doAttack(combat, level)
    else:
        combat.setState(CombatState.pickingAbility)


proc updateCombatScreen*(combat: var CombatScreen,
                         level: var Level,
                         keyboard: Keyboard,
                         dt: float): ScreenChange =
    if combat.tempMessage.isNotEmpty:
        combat.tempMessageCountdown -= dt
        if combat.tempMessageCountdown <= 0:
            combat.tempMessageCountdown = 0
            combat.tempMessage = ""


    let activeChar = combat.turnOrder[combat.turn]
    let isAlly = activeChar in combat.playerParty

    let moveY =
        if keyboard.keyPressed(Input.up): -1
        elif keyboard.keyPressed(Input.down): 1
        else: 0

    let moveX =
        if keyboard.keyPressed(Input.left): -1
        elif keyboard.keyPressed(Input.right): 1
        else: 0

    let enterPressed = keyboard.keyPressed(Input.enter)
    let backPressed = keyboard.keyPressed(Input.back)

    case combat.state
    of CombatState.pickingAbility:
        if backPressed:
            combat.log("Can't go back", false)

        combat.menuCursor =
            (combat.menuCursor + moveY) %% activeChar.numAbilites
        if enterPressed:
            combat.activeAbility = activeChar.getAbility(combat.menuCursor)
            if combat.activeAbility.isNone:
                result = combat.goToNextTurn(level)
            elif combat.activeAbility.turnCost > combat.turnPointsRemaining:
                combat.log("No time!", false)
            elif activeChar.canCast(combat.activeAbility):
                combat.setState(CombatState.pickingAbilityTarget)
            else:
                combat.log("Can't cast that", false)

    of CombatState.pickingAbilityTarget:
        if backPressed:
            combat.log("Can't go back", false)

        let ability = combat.activeAbility
        case ability.abilityType
        of AbilityType.ranged:
            let paths = expandMovementPattern(activeChar.currentTile,
                                              ability.movementPattern)

            combat.menuCursor =
                (combat.menuCursor + moveY) %% paths.len
            if enterPressed:
                let path = paths[combat.menuCursor]
                combat.rangedAbilityMovementPathIndex = combat.menuCursor
                if not movementPathIsValid(combat, level, path,
                        ability.canJump):
                    combat.log("Can't move there", false)
                else:
                    combat.movementStart = activeChar.currentTile
                    activeChar.teleport(path.last,
                        Direction.down, # TODO face the right direction
                        level)
                    combat.setState(CombatState.pickingRangedAbilitySecondaryTarget)
        of AbilityType.targeted:
            combat.mapCursor = combat.mapCursor + v(moveX, moveY)

            if enterPressed:
                doAttack(combat, level)

        else:
            TODO("Implement ability types other than RANGED and TARGETED")
            # doAttack(combat, level)

    of CombatState.pickingRangedAbilitySecondaryTarget:
        if backPressed:
            activeChar.teleport(combat.movementStart,
                combat.movementStart.directionTo(activeChar.currentTile),
                level)
            combat.setState(CombatState.pickingAbilityTarget)

        let ability = combat.activeAbility
        case ability.abilityType
        of AbilityType.ranged:
            let paths = expandMovementPattern(activeChar.currentTile,
                                              ability.projectilePattern)
            combat.menuCursor =
                (combat.menuCursor + moveY) %% paths.len
            if enterPressed:
                doAttack(combat, level)
        else:
            echo "ERROR: entered secodary target combat state with non-ranged ability"
            combat.setState(CombatState.playingAinimation)


    of CombatState.playingAinimation:
        let ANIMATION_TIME_MS = 1000 # TODO placeholder
        if combat.animationTimer < ANIMATION_TIME_MS:
            combat.animationTimer += int(math.round(dt * 1000))
        else:
            # Animation finished
            # Clean up and go to next turn
            combat.turnPointsRemaining -= combat.activeAbility.turnCost
            echo "turn points remaining: " & $combat.turnPointsRemaining
            if combat.turnPointsRemaining > 0 and isAlly:
                echo "Turn points remaining; going to pick ability again"
                combat.setState(CombatState.pickingAbility)
            else:
                echo "No turn points left; going to next turn"
                result = combat.goToNextTurn(level)



import
    sdl2,
    sequtils,
    math,
    patty,
    algorithm

import
    ../astar,
    ../ability_utils,
    ../character_utils,
    ../constants,
    ../game_utils,
    ../keyboard,
    ../matrix,
    ../types,
    ../utils,
    ../vector,
    combat_utils


proc getCharacterAtTile(combat: CombatScreen, v: Vec2): Character =
    for c in combat.turnOrder:
        if c.currentTile == v:
            return c
    return nil

proc getTarget(combat: CombatScreen, v: Vec2): AbilityTarget =
    let abilityType: AbilityType = combat.activeAbility.abilityType
    if abilityType == AbilityType.aoe:
        abilityTargetTile(v)
    else:
        abilityTargetCharacter(combat.getCharacterAtTile(v))

proc validateTarget*(caster: Character,
                     target: AbilityTarget,
                     allies: seq[Character],
                     ability: Ability): (bool, string) =
    echo "Validate Target:"
    echo "  caster:" & $caster
    echo "  target:" & $target
    echo "  allies:" & $allies
    echo "  ability:" & $ability
    if ability.isNone: return (true, nil)
    let weapon = caster.getWeaponInfo
    if not caster.canCast(ability):
        return (false, "Can't cast that")
    if distance(caster.currentTile,
                target.getPosition) > ability.getRange(weapon):
        return (false, "Out of range")

    match target:
        TargetCharacter(character: target):
            let casterIsAlly = caster in allies
            let targetIsAlly = target in allies
            if target.isNil:
                return (false, "No one is there!")
            if ability.abilityType == AbilityType.enemyTarget and
                    casterIsAlly == targetIsAlly:
                return (false, "That's an ally!")
            if ability.abilityType == AbilityType.allyTarget and
                    casterIsAlly != targetIsAlly:
                return (false, "That's an enemy!")
        TargetTile(tile: _): discard

    if not ability.isValidTarget.isNil and
            not ability.isValidTarget(caster, target, weapon):
        return (false, "Invalid target")

    return (true, nil)


proc validateTarget(combatInfo: CombatScreen,
                    caster: Character, target: AbilityTarget,
                    ability: Ability): (bool, string) {.inline.} =
    validateTarget(caster, target, combatInfo.playerParty,
                   ability)

proc numAlive(combat: CombatScreen): (int, int) =
    var numAllies, numEnemies = 0
    for c in combat.turnOrder:
        if c.health > 0:
            if c in combat.playerParty:
                inc(numAllies)
            elif c in combat.enemyParty:
                inc(numEnemies)
    return (numAllies, numEnemies)

proc tickAuras(combat: var CombatScreen, caster: Character) =
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


proc goToNextTurn(combat: var CombatScreen, level: var Level): ScreenChange =


    alias activeChar: combat.turnOrder[combat.turn]

    echo "turn end: " & $activeChar
    echo " -- next turn ---------------------"

    # Check if anyone is still alive
    let (numAllies, numEnemies) = combat.numAlive
    if numEnemies == 0 or numAllies == 0:
        return ScreenCHange(changeTo: Screen.world)

    # Skip unconcious characters
    doUntil activeChar.health > 0:
        combat.turn = (combat.turn + 1) mod combat.turnOrder.len
        if activeChar.health <= 0:
            tickAuras(combat, activeChar)

    echo "turn start: " & $activeChar

    # apply aura effects
    for i in 0..<activeChar.auras.len:
        var aura = activeChar.auras[i]
        aura.effect(activeChar)
        aura.turns -= 1

    # Apply aoe effects
    let aoeAura = combat.aoeAuras[activeChar.currentTile]
    if not aoeAura.isNone:
        aoeAura.effect(activeChar)

    # Decrement aoe aura turn counters
    tickAuras(combat, activeChar)

    # go to the next character if the active character died from auras
    if activeChar.health <= 0:
        return goToNextTurn(combat, level)


    # Do AI for enemy turn or ask user to pcik movement
    if activeChar in combat.enemyParty:
        var path = activeChar.ai.combatMovement(
                activeChar,
                allies=combat.enemyParty,
                enemies=combat.playerParty,
                level=level
        )
        if path.isNil:
            echo "AI chose invalid path"
        else:
            combat.movementStart = activeChar.currentTile
            discard path.pop
            combat.path = path
            combat.setState(CombatState.waitingMovementAnimation)
    else:
        combat.turnPointsRemaining = ABILITY_POINTS_PER_TURN
        combat.setState(CombatState.pickingMovement)

proc pickEnemyAttack(combat: var CombatScreen, level: Level) =
    let activeChar = combat.turnOrder[combat.turn]
    let (ability, target) = activeChar.ai.chooseAttack(
            activeChar,
            combat.enemyParty,
            combat.playerParty,
            level
    )
    assert validateTarget(activeChar, target, combat.enemyParty, ability)[0]
    combat.activeAbility = ability
    combat.activeTarget = target
    combat.setState(CombatSTate.waitingAttackAnimation)


proc setupCombat(combat: var CombatScreen) =
    combat.turnOrder = concat(combat.playerParty, combat.enemyParty)
    combat.turnOrder.sort do (a, b: Character) -> int:
        result = cmp(a.get(Stat.initiative), b.get(Stat.initiative))

    # TODO set combat window on start (from animation)
    combat.center = combat.playerParty[0].currentTile
    combat.turn = 0
    let window = getCombatWindow(combat)
    combat.aoeAuras = newMatrixWithOffset[AoeAura](window.w, window.h,
        v(window.x, window.y))

    combat.turnPointsRemaining = ABILITY_POINTS_PER_TURN
    combat.setState(CombatState.pickingMovement)

proc updateCombatScreen*(combat: var CombatScreen,
                         level: var Level,
                         keyboard: Keyboard,
                         dt: float): ScreenChange =
    if combat.turnOrder.isNil:
        setupCombat(combat)

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
    of CombatState.pickingMovement:
        let window = getCombatWindow(combat)
        combat.mapCursor.x = clamp(combat.mapCursor.x + moveX,
                                   window.x, window.x + window.w - 1)
        combat.mapCursor.y = clamp(combat.mapCursor.y + moveY,
                                   window.y, window.y + window.h - 1)
        if enterPressed:
            var path = aStarSearch(level.collision,
                                   activeChar.currentTile,
                                   combat.mapCursor,
                                   includeGoal=true,
                                   rng=nil)
            combat.movementStart = activeChar.currentTile

            if path.isNil:
                combat.message = "Can't move there"
            else:
                discard path.pop
                combat.path = path
                combat.setState(CombatState.waitingMovementAnimation)
    of CombatState.waitingMovementAnimation:
        if backPressed and isAlly:
            activeChar.teleport(combat.movementStart,
                combat.movementStart.directionTo(activeChar.currentTile),
                level.collision)
            combat.setState(CombatState.pickingMovement)
        else:
            if not activeChar.isMoving:
                if combat.path.len == 0:
                    combat.path = nil
                    if isAlly:
                        combat.setState(CombatState.pickingAbility)
                    else:
                        pickEnemyAttack(combat, level)
                else:
                    let nextTile = combat.path.pop()
                    activeChar.moveToward(nextTile, level.collision)

            if activeChar.isMoving:
                activeChar.update(level, dt)

    of CombatState.pickingAbility:
        if not combat.message.isNil:
            if backPressed or enterPressed:
                combat.message = nil
        else:
            if backPressed:
                activeChar.teleport(combat.movementStart,
                    combat.movementStart.directionTo(activeChar.currentTile),
                    level.collision)
                combat.setState(CombatState.pickingMovement)
            else:
                combat.menuCursor =
                    (combat.menuCursor + moveY) %% activeChar.numAbilites
                if enterPressed:
                    combat.activeAbility = activeChar.getAbility(combat.menuCursor)
                    if combat.activeAbility.isNone:
                        result = combat.goToNextTurn(level)
                    elif combat.activeAbility.turnCost > combat.turnPointsRemaining:
                        combat.message = "No time!"
                    elif activeChar.canCast(combat.activeAbility):
                        combat.setState(CombatState.pickingTarget)
                    else:
                        combat.message = "Can't cast that"


    of CombatState.pickingTarget:
        if backPressed:
            combat.setState(CombatState.pickingAbility)
        let window = getCombatWindow(combat)
        combat.mapCursor.x = clamp(combat.mapCursor.x + moveX,
                                   window.x, window.x + window.w - 1)
        combat.mapCursor.y = clamp(combat.mapCursor.y + moveY,
                                   window.y, window.y + window.h - 1)
        if enterPressed:
            var target = combat.getTarget(combat.mapCursor)
            let (valid, reason) = combat.validateTarget(
                    activeChar, target, combat.activeAbility)
            combat.message = reason
            if valid:
                combat.activeTarget = target
                combat.setState(CombatSTate.waitingAttackAnimation)
    of CombatState.waitingAttackAnimation:
        #TODO wait until animation is completed
        let weapon = activeChar.getWeaponInfo
        let isMagical = combat.activeAbility.isMagical
        #TODO make this a match not case
        case combat.activeTarget.kind:
        of TargetCharacter:
            echo "combat.activeTarget.kind == TargetCharacter"
            let target = combat.activeTarget.character
            echo "  activeTarget.target == " & $target
            echo "  activeChar == " & $activeChar
            echo "  weapon == " & $activeChar.getWeaponInfo
            combat.activeAbility.applyEffect(
                        activeChar, target,
                        activeChar.getWeaponInfo)
            let afterEffect =
                if isMagical: weapon.magicAfterEffect
                else: weapon.kineticAfterEffect
            if not afterEffect.isNil:
                afterEffect(activeChar, target, level)

        of TargetTile:
            let target = combat.activeTarget.tile
            for v in combat.activeAbility.aoePattern:
                let tile = target + v
                if combat.aoeAuras.contains(tile):
                    combat.activeAbility.applyAoeEffect(
                            activeChar, tile, weapon, combat)
            let afterEffect =
                if isMagical: weapon.magicAoeAfterEffect
                else: weapon.kineticAoeAfterEffect
            if not afterEffect.isNil:
                afterEffect(activeChar, target, combat.activeAbility.aoePattern, level)

        activeChar.faceToward(combat.activeTarget.getPosition)
        combat.turnPointsRemaining -= combat.activeAbility.turnCost
        echo "turn points remaining: " & $combat.turnPointsRemaining
        if combat.turnPointsRemaining > 0 and isAlly:
            echo "Turn points remaining; going to pick ability again"
            combat.setState(CombatState.pickingAbility)
        else:
            echo "No turn points left; going to next turn"
            result = combat.goToNextTurn(level)

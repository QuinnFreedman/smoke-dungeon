import
    sequtils, 
    algorithm

import
    combat_utils,
    ../character_utils,
    ../types,
    ../matrix,
    ../vector,
    ../constants

proc initCombatScreen*(playerParty, enemyParty: seq[Character]): CombatScreen =
    result.playerParty = playerParty
    result.enemyParty = enemyParty
    result.turnOrder = concat(playerParty, enemyParty)
    result.turnOrder.sort do (a, b: Character) -> int:
        result = cmp(a.get(Stat.initiative), b.get(Stat.initiative))
    
    result.rangedAbilityMovementPathIndex = -1
    result.movementStart = result.turnOrder[0].currentTile
    result.turnPointsRemaining = ABILITY_POINTS_PER_TURN

    # TODO set combat window on start (from animation)
    result.center = playerParty[0].currentTile
    result.turn = 0
    let window = getCombatWindow(result)
    result.aoeAuras = newMatrixWithOffset[AoeAura](window.w, window.h,
        v(window.x, window.y))
    
    result.turnPointsRemaining = ABILITY_POINTS_PER_TURN
    result.setState(CombatState.pickingAbility)

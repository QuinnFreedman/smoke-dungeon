import
    sequtils,
    sdl2,
    sugar

import
    ../constants,
    ../types,
    ../utils,
    ../vector

func getCombatCenter*(playerParty, enemyParty: seq[Character]): Vec2 =
    var x, y: float
    var count: int
    for character in flatten(playerParty, enemyParty):
        x += float character.currentTile.x
        y += float character.currentTile.y
        inc count

    return vecFloat(x / count.float, y / count.float).round

func getCombatWindow(center: Vec2): Rect =
    newSdlRect(center.x - COMBAT_SCREEN_RADIUS_X,
               center.y - COMBAT_SCREEN_RADIUS_Y,
               2 * COMBAT_SCREEN_RADIUS_X + 1,
               2 * COMBAT_SCREEN_RADIUS_Y + 1)

func getCombatWindow*(combat: CombatScreen): Rect =
    getCombatWindow(combat.center)

func getCombatWindow*(playerParty, enemyParty: seq[Character]): Rect =
    getCombatWindow(getCombatCenter(playerParty, enemyParty))

let ROTATION_MATRICES = @[
    MATRIX_IDENTITY,
    MATRIX_ROT_90,
    MATRIX_ROT_180,
    MATRIX_ROT_270
]

func expandMovementPattern*(origin: Vec2, pattern: seq[seq[Vec2]]): seq[seq[Vec2]] =
    for i in 0..3:
        for path in pattern:
            result.add(path.map(x => x.transform(ROTATION_MATRICES[i])))

    for i, path in result:
        for j, v in path:
            result[i][j] = v + origin

func getEnemies*(combat: CombatScreen): seq[Character] =
    let activeChar = combat.turnOrder[combat.turn]
    if activeChar in combat.playerParty:
        return combat.enemyParty
    else:
        return combat.playerParty

func getAllies*(combat: CombatScreen): seq[Character] =
    let activeChar = combat.turnOrder[combat.turn]
    if activeChar in combat.playerParty:
        return combat.playerParty
    else:
        return combat.enemyParty

func getPathOptions*(combat: CombatScreen): seq[seq[Vec2]] =
    let ability = combat.activeAbility
    let activeCharPos = combat.turnOrder[combat.turn].currentTile
    case combat.state
    of CombatState.pickingAbilityTarget:
        case ability.abilityType
        of AbilityType.ranged:
            result = expandMovementPattern(activeCharPos,
                    ability.movementPattern)
        of AbilityType.dash:
            result = expandMovementPattern(activeCharPos, ability.pattern)
        else:
            discard

    of CombatState.pickingRangedAbilitySecondaryTarget:
        case ability.abilityType
        of AbilityType.ranged:
            result = expandMovementPattern(activeCharPos,
                    ability.projectilePattern)
        else:
            discard
    else:
        discard

proc log*(combat: var CombatScreen, message: string, save: bool) =
    if save:
        combat.messageLog.add(message)
        combat.tempMessage = message
        echo message
    else:
        if message != combat.tempMessage:
            echo message
        combat.tempMessage = message
        combat.tempMessageCountdown = 2

import
    sdl2

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

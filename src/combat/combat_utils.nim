import sdl2

import
    ../types,
    ../utils

proc getCombatWindow*(combat: CombatScreen): Rect =
    const radiusX = 3
    const radiusY = 2

    newSdlRect(combat.center.x - radiusX,
               combat.center.y - radiusY,
               2 * radiusX + 1, 2 * radiusY + 1)

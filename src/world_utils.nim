import sdl2

import
  constants,
  vector,
  utils

proc getRenderWindow*(playerPos: Vec2): Rect =
    let radiusX = SCREEN_WIDTH_TILES div 2 + 1
    let radiusY = SCREEN_HEIGHT_TILES div 2 + 1
    newSdlRect(playerPos.x - radiusX, playerPos.y - radiusY,
               2 * radiusX + 1, 2 * radiusY + 1)

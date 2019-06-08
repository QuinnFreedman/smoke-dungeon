import sdl2

import
  ../constants,
  ../vector,
  ../utils

func getRenderWindow(playerPos: Vec2): Rect =
    let radiusX = SCREEN_WIDTH_TILES div 2
    let radiusY = SCREEN_HEIGHT_TILES div 2
    newSdlRect(playerPos.x - radiusX, playerPos.y - radiusY,
               2 * radiusX + 1, 2 * radiusY + 1)

func getRenderWindow*(currentPos: Vec2, nextPos: Vec2): Rect =
    let rect1 = getRenderWindow(currentPos)
    let rect2 = getRenderWindow(nextPos)
    let upperLeft = v(
        min(rect1.x, rect2.x),
        min(rect1.y, rect2.y)
    )
    let lowerRight = v(
        max(rect1.x + rect1.w, rect2.x + rect2.w),
        max(rect1.y + rect1.h, rect2.y + rect2.h)
    )

    newSdlRect(
        upperLeft.x,
        upperLeft.y,
        lowerRight.x - upperLeft.x,
        lowerRight.y - upperLeft.y
    )

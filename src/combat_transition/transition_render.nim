import
    math,
    sdl2

import
    ../constants,
    ../render_map,
    ../render_utils,
    ../types,
    ../utils,
    ../vector

proc renderTransitionScreen*(transition: CombatTransitionScreen,
                             gameState: GameState,
                             renderInfo: RenderInfo) =

    let progress = transition.timeElapsed / TRANSITION_LENGTH_SECONDS
    let startCenter = vecFloat(
        (transition.startWindow.w - 1) / 2 + transition.startWindow.x.float,
        (transition.startWindow.h - 1) / 2 + transition.startWindow.y.float
    )
    let endCenter = vecFloat(
        (transition.endWindow.w - 1) / 2 + transition.endWindow.x.float,
        (transition.endWindow.h - 1) / 2 + transition.endWindow.y.float
    )
    let center = lerp(progress, startCenter, endCenter)

    let width = boundedLerp(progress, transition.startWindow.w,
                            transition.endWindow.w)

    let height = boundedLerp(progress, transition.startWindow.h,
                             transition.endWindow.h)

    let x = center.x - (width / 2)
    let y = center.y - (height / 2)


    let window = rect(x.floor.cint, y.floor.cint,
                      width.ceil.cint + 1, height.ceil.cint + 1)

    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)

    let transform = round(center.scale(-TILE_SIZE) +
                          screenCenter -
                          vecFloat(TILE_SIZE / 2, TILE_SIZE / 2))

    var clip = rect(
        cint(round(screenCenter.x - (width * TILE_SIZE / 2))),
        cint(round(screenCenter.y - (height * TILE_SIZE / 2))),
        cint(round(width * TILE_SIZE)),
        cint(round(height * TILE_SIZE)),
    )
    discard rendererSetClipRect(renderInfo.renderer, addr clip)

    renderMap(gameState.level, window,
              renderInfo.renderer, transform, fow=true)

    discard rendererSetClipRect(renderInfo.renderer, nil)

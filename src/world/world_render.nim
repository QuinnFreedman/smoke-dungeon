import strutils,
       sdl2,
       math

import
    ../types,
    ../matrix,
    ../textures,
    ../vector,
    ../constants,
    ../utils,
    ../character_utils,
    ../render_map,
    ../render_utils,
    ../render_character,
    ../item_utils,
    ../textures,
    world_utils

proc debugRedTile(tile: Vec2, renderer: RendererPtr, transform: Vec2) =
    renderer.setDrawBlendMode(BlendMode_Blend)
    let tilePos = tile.scale(TILE_SIZE)
    let myRect = rect(tilePos.x.cint, tilePos.y.cint, TILE_SIZE, TILE_SIZE)
    fillRect(myRect, color(225, 0, 0, 100), renderer, transform)


proc debugRenderCollision*(level: Level, window: Rect,
        renderer: RendererPtr, transform: Vec2) =
    for pos in window.iterRect:
        if level.collision(pos):
            debugRedTile(pos, renderer, transform)


proc renderMask(mask1, mask2: Matrix[bool], blend: float, window: Rect,
                renderer: RendererPtr, transform: Vec2) =

    renderer.setDrawBlendMode(BlendMode_Blend)
    for pos in window.iterRect:
        let r = newSdlSquare(pos.x * TILE_SIZE, pos.y * TILE_SIZE, TILE_SIZE)
        let alpha: float =
            if mask1[pos]:
                if mask2[pos]: 1.0
                else: 1 - blend
            else:
                if mask2[pos]: blend
                else: 0.0

        fillRect(r, color(0, 0, 0, uint8(alpha * 150)),
                 renderer, transform)


proc renderGameFrame*(gamestate: GameState, renderer: RendererPtr) =
    let level = gamestate.level
    let pc: Character = gamestate.playerParty[0]
    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    let transform = round(pc.actualPos.scale(-TILE_SIZE) + screenCenter - vecFloat(TILE_SIZE / 2, TILE_SIZE / 2))

    let window = getRenderWindow(pc.currentTile, pc.nextTile)

    renderMap(level, window, renderer, transform)
    # debugRenderCollision(level, window, renderer, transform)

    if gamestate.inspectMode:
        drawImage(TextureAlias.mapCursor,
                  gamestate.inspectCursor.scale(TILE_SIZE),
                  renderer, transform)

    for character in gamestate.entities:
        renderCharacter(character, renderer, transform)

    renderMask(level.shadowMask1, level.shadowMask2, pc.animationTimer, window,
               renderer, transform)

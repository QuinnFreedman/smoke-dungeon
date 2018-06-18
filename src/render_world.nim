import strutils,
       sdl2,
       math

import
    types,
    matrix,
    textures,
    vector,
    constants,
    utils,
    character_utils,
    render_utils,
    render_character,
    item_utils,
    textures,
    world_utils

proc renderMap*(map: Level, window: Rect,
                renderer: RendererPtr, transform: Vec2) =
    alias textures: map.textures
    for pos in window.iterRect:
        if textures.contains(pos) and map.seen[pos]:
            let srect = textures[pos]
            let tilePos = pos.scale(TILE_SIZE)
            drawTile(TextureAlias.mapTiles,
                     srect, tilePos, renderer, transform)

# proc debugRenderCollision*(collision: Matrix[uint8], window: Rect,
#         renderer: RendererPtr, transform: Vec2) =
#     renderer.setDrawBlendMode(BlendMode_Blend)
#     for pos in window.iterRect:
#         if collision.contains(pos):
#             if collision[pos] > 0.uint8:
#                 let tilePos = pos.scale(TILE_SIZE)
#                 let myRect = rect(tilePos.x.cint, tilePos.y.cint, TILE_SIZE, TILE_SIZE)
#                 fillRect(myRect, color(225, 0, 0, 100), renderer, transform)


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

    let window = getRenderWindow(pc.currentTile)

    renderMap(level, window, renderer, transform)
    # debugRenderCollision(level.collision, window, renderer, transform)

    for character in gamestate.entities:
        renderCharacter(character, renderer, transform)

    renderMask(level.shadowMask1, level.shadowMask2, pc.animationTimer, window,
               renderer, transform)

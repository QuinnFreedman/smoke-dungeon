import strutils,
       sdl2,
       math

import
    types,
    matrix,
    textures,
    vector,
    character,
    constants,
    utils,
    render_utils,
    shadowcasting,
    item,
    textures

proc renderMap*(map: Matrix[sdl2.Rect], window: Rect,
                renderer: RendererPtr, transform: Vec2) =
    for pos in window.iterRect:
        if map.contains(pos):
            let srect = map[pos]
            let tilePos = pos.scale(TILE_SIZE)
            drawTile(TextureAlias.mapTiles,
                    srect, tilePos, renderer, transform)

proc debugRenderCollision*(collision: Matrix[uint8], window: Rect,
        renderer: RendererPtr, transform: Vec2) =
    renderer.setDrawBlendMode(BlendMode_Blend)
    for pos in window.iterRect:
        if collision.contains(pos):
            if collision[pos] > 0.uint8:
                let tilePos = pos.scale(TILE_SIZE)
                let myRect = rect(tilePos.x.cint, tilePos.y.cint, TILE_SIZE, TILE_SIZE)
                fillRect(myRect, color(225, 0, 0, 100), renderer, transform)


proc renderCharacter*(character: Character,
                      renderer: RendererPtr, transfrom: Vec2) =
    var drect = character.getDestRect
    if character.health > 0:
        var srect = character.getSrcRect
        drawImage(character.spritesheet,
                  srect, drect, renderer, transfrom)
        for item in character.iterWornItems:
            let sprite = item.getTexture(character.sex)
            drawImage(sprite, srect, drect, renderer, transfrom)
    else:
        var srect = rect(0, 0, TILE_SIZE, TILE_SIZE)
        drawImage(TextureAlias.bloodStain, srect, drect,
                  renderer, transfrom)


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


proc getRenderWindow(playerPos: Vec2): Rect =
    let radiusX = SCREEN_WIDTH_TILES div 2 + 1
    let radiusY = SCREEN_HEIGHT_TILES div 2 + 1
    newSdlRect(playerPos.x - radiusX, playerPos.y - radiusY - 1,
               2 * radiusX + 1, 2 * radiusY + 2)


proc renderGameFrame*(gamestate: GameState, renderer: RendererPtr) =
    let level = gamestate.level
    let pc: Character = gamestate.playerParty[0]
    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    let transform = round(pc.actualPos.scale(-TILE_SIZE) + screenCenter)

    let window = getRenderWindow(pc.currentTile)

    renderMap(level.textures, window, renderer, transform)
    for character in gamestate.entities:
        renderCharacter(character, renderer, transform)

    #TODO don't alloc these every frame
    var shadowMask1 = newMatrixWithOffset[bool](window.w, window.h,
                                                v(window.x, window.y))
    var shadowMask2 = newMatrixWithOffset[bool](window.w, window.h,
                                                v(window.x, window.y))
    shadowCast(pc.currentTile, shadowMask1, level.walls)
    shadowCast(pc.nextTile, shadowMask2, level.walls)
    renderMask(shadowMask1, shadowMask2, pc.animationTimer, window,
               renderer, transform)

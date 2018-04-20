import strutils,
       sdl2,
       math

import gamestate,
       matrix,
       textures,
       vector,
       character,
       constants,
       utils,
       render_utils,
       shadowcasting

proc renderMap(map: Matrix[sdl2.Rect], window: Rect,
               renderer: RendererPtr, transfrom: Vec2) =
    for pos in window.iterRect:
        if map.contains(pos):
            let srect = map[pos]
            let tilePos = pos.scale(TILE_SIZE)
            drawTile(TextureAlias.mapTiles,
                    srect, tilePos, renderer, transfrom)


proc renderCharacter(character: Character,
                     renderer: RendererPtr, transfrom: Vec2) =
    var srect = character.getSrcRect
    var drect = character.getDestRect
    drawImage(character.spritesheet,
              srect, drect, renderer, transfrom)
    for item in character.iterWornItems:
        let sprite =
            if character.sex == Sex.male: item.textureMale
            else: item.textureFemale
        drawImage(sprite, srect, drect, renderer, transfrom)

proc renderRect(drect: Rect, renderer: RendererPtr, transform: Vec2) =
        var newRect = rect(
            drect.x + cint(transform.x),
            drect.y + cint(transform.y),
            drect.w,
            drect.h
        )
        renderer.fillRect(newRect)

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
        renderer.setDrawColor(0, 0, 0, uint8(alpha * 150))
        renderRect(r, renderer, transform)
    

proc getRenderWindow(playerPos: Vec2): Rect =
    let radiusX = SCREEN_WIDTH_TILES div 2 + 1
    let radiusY = SCREEN_HEIGHT_TILES div 2 + 1
    newSdlRect(playerPos.x - radiusX, playerPos.y - radiusY - 1,
               2 * radiusX + 1, 2 * radiusY + 2)


proc renderGameFrame*(game: Game) =
    let gamestate: GameState = game.gameState
    let level = gamestate.level
    let pc: Character = gamestate.playerCharacter
    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    var transform = round(pc.actualPos.scale(-TILE_SIZE) + screenCenter)

    let window = getRenderWindow(pc.currentTile)

    renderMap(level.textures, window, game.renderer, transform)
    renderCharacter(pc, game.renderer, transform)
    #TODO don't alloc these every frame
    var shadowMask1 = newMatrixWithOffset[bool](window.w, window.h,
                                                v(window.x, window.y))
    var shadowMask2 = newMatrixWithOffset[bool](window.w, window.h,
                                                v(window.x, window.y))
    shadowCast(pc.currentTile, shadowMask1, level.walls)
    shadowCast(pc.nextTile, shadowMask2, level.walls)
    renderMask(shadowMask1, shadowMask2, pc.animationTimer, window,
               game.renderer, transform)
    

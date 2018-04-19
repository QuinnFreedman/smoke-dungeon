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
       shadowcasting

const
    HINT_RENDER_SCALE_QUALITY* = cstring("SDL_RENDER_SCALE_QUALITY")
    NEAREST* = cstring("0")

proc renderTile(texture: TexturePtr, srcRect: Rect, pos: Vec2,
                renderer: RendererPtr, transform: Vec2) {.inline.} =
    var drect = newSdlSquare(
        pos.x + transform.x, pos.y + transform.y, TILE_SIZE)
    
    var srect = srcRect
    let _ = sdl2.copyEx(renderer, texture, srect, drect, angle=0, center=nil, flip=SDL_FLIP_NONE)

proc drawImage(texture: TexturePtr, srcRect: var Rect, destRect: var Rect,
               renderer: RendererPtr, transform: Vec2) {.inline.} =
    var drect = rect(
        cint(destRect.x + transform.x),
        cint(destRect.y + transform.y),
        destRect.w,
        destRect.h
    )
    let _ = sdl2.copyEx(renderer, texture, srcRect, drect,
                        angle=0, center=nil, flip=SDL_FLIP_NONE)

proc renderMap(map: Matrix[sdl2.Rect], window: Rect,
               renderer: RendererPtr, transfrom: Vec2) =
    for pos in window.iterRect:
        if map.contains(pos):
            let srect = map[pos]
            let tilePos = pos.scale(TILE_SIZE)
            renderTile(TextureAlias.mapTiles.getTexture(),
                    srect, tilePos, renderer, transfrom)


proc renderCharacter(character: Character,
                     renderer: RendererPtr, transfrom: Vec2) =
    var srect = character.getSrcRect
    var drect = character.getDestRect
    drawImage(character.spritesheet.getTexture(),
              srect, drect, renderer, transfrom)

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
                else: blend
            else:
                if mask2[pos]: 1 - blend
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
    

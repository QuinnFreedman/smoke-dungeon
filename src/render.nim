import strutils,
       sdl2,
       math

import gamestate,
       matrix,
       rectangle,
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

proc renderMap(map: var Matrix[sdl2.Rect],
               renderer: RendererPtr, transfrom: Vec2) =
    #TODO make foreach return an iterator instead so we don't gc the closure
    for x, y in map.indices:
        let pos = v(x * TILE_SIZE, y * TILE_SIZE)
        let srect = map[x, y]
        renderTile(TextureAlias.mapTiles.getTexture(),
                   srect, pos, renderer, transfrom)


proc renderCharacter(character: var Character,
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

proc renderMask(mask1, mask2: Matrix[bool], blend: float,
                renderer: RendererPtr, transform: Vec2) =
    
    renderer.setDrawBlendMode(BlendMode_Blend)
    for x, y in mask1.indices:
        let r = newSdlSquare(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE)
        let alpha: float =
            if mask1[x, y]:
                if mask2[x, y]: 1.0
                else: blend
            else:
                if mask2[x, y]: 1 - blend
                else: 0.0
        renderer.setDrawColor(0, 0, 0, uint8(alpha * 150))
        renderRect(r, renderer, transform)
    


proc renderGameFrame*(game: var Game) =
    var transform = ZERO
    renderMap(game.gamestate.mapTextures, game.renderer, transform)
    renderCharacter(game.gamestate.playerCharacter, game.renderer, transform)
    #TODO don't alloc these every frame
    var shadowMask1 = newMatrix[bool](game.gamestate.walls.width, game.gamestate.walls.height)
    var shadowMask2 = newMatrix[bool](game.gamestate.walls.width, game.gamestate.walls.height)
    shadowCast(game.gamestate.playerCharacter.currentTile, shadowMask1,
               game.gamestate.walls)
    shadowCast(game.gamestate.playerCharacter.nextTile, shadowMask2,
               game.gamestate.walls)
    renderMask(shadowMask1, shadowMask2,
               game.gameState.playerCharacter.animationTimer,
               game.renderer, transform)
    

# seed 1524022525

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
       utils

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


proc renderGameFrame*(game: var Game) =
    var transform = ZERO
    renderMap(game.gamestate.mapTextures, game.renderer, transform)
    renderCharacter(game.gamestate.playerCharacter, game.renderer, transform)


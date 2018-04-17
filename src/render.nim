import strutils,
       sdl2,
       math

import gamestate,
       matrix,
       rectangle,
       resources,
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

proc renderMap(resources: var GameResources, map: var Matrix[int],
               renderer: RendererPtr, transfrom: Vec2) =
    #TODO make foreach return an iterator instead so we don't gc the closure
    let resources = resources
    let map = map
    newRectangle(0, 0, map.width, map.height).forEach do (x, y: int):
        let pos = v(x * TILE_SIZE, y * TILE_SIZE)
        let srect: Rect = resources.mapTiles[map[x, y] + x + y]
        renderTile(resources.mapTexture, srect, pos, renderer, transfrom)


proc renderCharacter(character: var Character, resources: var GameResources,
                     renderer: RendererPtr, transfrom: Vec2) =
    var srect = character.getSrcRect
    var drect = character.getDestRect
    drawImage(resources.getBaseSpriteSheet(character.race, character.sex),
              srect, drect, renderer, transfrom)


proc renderGameFrame*(game: var Game) =
    var transform = ZERO
    renderMap(game.resources, game.gamestate.map, game.renderer, transform)
    renderCharacter(game.gamestate.playerCharacter, game.resources,
                    game.renderer, transform)


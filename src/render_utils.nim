import sdl2

import
    vector,
    constants,
    textures,
    utils

proc drawTile*(textureAlias: TextureAlias, srcRect: Rect, pos: Vec2,
               renderer: RendererPtr, transform: Vec2) {.inline.} =
    let texture = textureAlias.getTexture()
    var drect = newSdlSquare(
        pos.x + transform.x, pos.y + transform.y, TILE_SIZE)

    var srect = srcRect
    let _ = sdl2.copyEx(renderer, texture, srect, drect, angle=0, center=nil, flip=SDL_FLIP_NONE)

proc drawImage*(texture: TextureAlias, srcRect: var Rect, destRect: var Rect,
                renderer: RendererPtr, transform: Vec2) {.inline.} =
    var drect = rect(
        cint(destRect.x + transform.x),
        cint(destRect.y + transform.y),
        destRect.w,
        destRect.h
    )
    let _ = sdl2.copyEx(renderer, texture.getTexture, srcRect, drect,
                        angle=0, center=nil, flip=SDL_FLIP_NONE)


proc drawImage*(texture: TextureAlias, pos: Vec2,
                renderer: RendererPtr, transform: Vec2) {.inline.} =
    let size = texture.getDimens
    var drect = rect(
        cint(pos.x + transform.x),
        cint(pos.y + transform.y),
        cint(size.x),
        cint(size.y)
    )
    let _ = sdl2.copy(renderer, texture.getTexture, nil, addr(drect))

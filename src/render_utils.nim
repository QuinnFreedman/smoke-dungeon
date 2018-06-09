import
    sdl2,
    sdl2.ttf

import
    vector,
    constants,
    textures,
    utils,
    lru_cache

type SDLException = object of Exception

template sdlFailIf*(cond: typed, reason: string) =
    if cond: raise SDLException.newException(
        reason & ", SDL error: " & $getError())

proc drawTile*(textureAlias: TextureAlias, srcRect: Rect, pos: Vec2,
               renderer: RendererPtr, transform: Vec2) {.inline.} =
    let texture = textureAlias.getTexture()
    var drect = newSdlSquare(
        pos.x + transform.x, pos.y + transform.y, TILE_SIZE)

    var srect = srcRect
    let _ = sdl2.copy(renderer, texture, addr srect, addr drect)

proc drawImage*(texture: TextureAlias, srcRect: var Rect, destRect: var Rect,
                renderer: RendererPtr, transform: Vec2) {.inline.} =
    var drect = rect(
        cint(destRect.x + transform.x),
        cint(destRect.y + transform.y),
        destRect.w,
        destRect.h
    )
    let _ = sdl2.copy(renderer, texture.getTexture, addr srcRect, addr drect)


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


proc fillRect*(drect: Rect, color: Color,
               renderer: RendererPtr, transform: Vec2) =
    var newRect = rect(
        drect.x + cint(transform.x),
        drect.y + cint(transform.y),
        drect.w,
        drect.h
    )
    var r, g, b, a: uint8
    renderer.getDrawColor(r, g, b, a)
    renderer.setDrawColor(color)
    renderer.fillRect(newRect)
    renderer.setDrawColor(r, g, b, a)


proc drawRect*(drect: Rect, color: Color,
               renderer: RendererPtr, transform: Vec2) =
    var newRect = rect(
        drect.x + cint(transform.x),
        drect.y + cint(transform.y),
        drect.w,
        drect.h
    )
    var r, g, b, a: uint8
    renderer.getDrawColor(r, g, b, a)
    renderer.setDrawColor(color)
    renderer.drawRect(newRect)
    renderer.setDrawColor(r, g, b, a)


type
    RenderInfo* = object
        renderer*: RendererPtr
        font*: FontPtr
        textCache*: TextCache

    TextCache = ref object
        text: string
        cache: CacheLine

    CacheLine = object
        texture: TexturePtr
        w, h: cint


proc newTextCache*: TextCache =
  new result


proc renderText*(renderInfo: RenderInfo, text: string,
                 pos: Vec2, color: Color) =
    proc simpleRenderText(renderer: RendererPtr, font: FontPtr,
                          text: string, color: Color): CacheLine {.nimcall.} =
        let surface = font.renderUtf8Solid(text.cstring, color)
        sdlFailIf surface.isNil: "Could not render text surface"

        discard surface.setSurfaceAlphaMod(color.a)

        result.w = surface.w
        result.h = surface.h
        result.texture = renderer.createTextureFromSurface(surface)
        sdlFailIf result.texture.isNil:
            "Could not create texture from rendered text"

        surface.freeSurface()


    let tc = renderInfo.textCache

    if text != tc.text:
        tc.cache.texture.destroy()
        tc.cache = simpleRenderText(renderInfo.renderer,
                renderInfo.font, text, color)
        tc.text = text

    var source = rect(0, 0, tc.cache.w, tc.cache.h)
    var dest = rect(pos.x.cint, pos.y.cint, tc.cache.w, tc.cache.h)
    renderInfo.renderer.copy(tc.cache.texture, addr source, addr dest)

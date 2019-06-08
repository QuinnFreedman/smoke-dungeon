import
    sdl2,
    sdl2/ttf

import
    constants,
#     lru_cache,
    textures,
    utils,
    vector

# patch for missing methods in SDL2
{.push callConv: cdecl, dynlib: sdl2.LibName.}
func rendererSetClipRect*(renderer: RendererPtr; rect: ptr Rect): cint {.
  importc: "SDL_RenderSetClipRect".}
func rendererGetClipRect*(renderer: RendererPtr; rect: ptr Rect): cint {.
  importc: "SDL_RenderGetClipRect".}
func renderIsClipEnabled*(renderer: RendererPtr): cint {.
  importc: "SDL_RenderIsClipEnabled".}
{.pop.}

const WHITE* = color(r=255, g=255, b=255, a=255)
const RED* = color(r=255, g=0, b=0, a=255)
const BLUE* = color(r=0, g=0, b=255, a=255)


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


func fillRect*(drect: Rect, color: Color,
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


func drawRect*(drect: Rect, color: Color,
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
        # textCache*: TextCache

    # TextCache = ref LRUCache[string, CacheLine]

    CacheLine = object
        texture: TexturePtr
        w, h: cint


# func newTextCache*: TextCache =
#     new result
#     result[] = newLRUCache[string, CacheLine](10, CacheLine(),
#             proc(k: string, v: CacheLine) = v.texture.destroy())


func renderText*(renderInfo: RenderInfo, text: string,
                 pos: Vec2, color: Color) =
    func simpleRenderText(renderer: RendererPtr, font: FontPtr,
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


    # var tc = renderInfo.textCache

    # let cachedTexture = tc[].get(text)
    # let texture =
    #     if cachedTexture.texture.isNil:
    #         let newTexture =
    #             simpleRenderText(renderInfo.renderer,
    #                              renderInfo.font, text, color)
    #         tc[].put(text, newTexture)
    #         newTexture
    #     else:
    #         cachedTexture

    let texture = simpleRenderText(renderInfo.renderer,
                                   renderInfo.font, text, color)

    var dest = rect(pos.x.cint, pos.y.cint, texture.w, texture.h)
    renderInfo.renderer.copy(texture.texture, nil, addr dest)


func getTextSize*(renderInfo: RenderInfo, text: string): Point =
    # let cachedTexture = renderInfo.textCache[].get(text)

    # if not cachedTexture.texture.isNil:
    #    return point(cachedTexture.w, cachedTexture.h)

    var w, h: cint
    sdlFailIf sizeText(renderInfo.font, text, addr w, addr h) < 0:
        "Unable to get font size"
    return point(w, h)

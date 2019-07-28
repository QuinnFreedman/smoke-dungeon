import
    sdl2,
    sdl2/image,
    sdl2/ttf,
    os,
    times,
    streams,
    math

type SDLException = object of Exception

template sdlFailIf*(cond: typed, reason: string) =
    if cond: raise SDLException.newException(
        reason & ", SDL error: " & $getError())

template staticReadRW(filename: string): ptr RWops =
    const file = staticRead(filename)
    rwFromConstMem(file.cstring, file.len.cint)

func scaleToFit(rect, bounds: Point, intScale: bool = false): Rect =
    var scale = min(bounds.x / rect.x, bounds.y / rect.y)

    if intScale:
        scale = scale.floor

    result.w = (rect.x.float * scale).round.cint
    result.h = (rect.y.float * scale).round.cint

    result.y = ((bounds.y - result.h) / 2).round.cint
    result.x = ((bounds.x - result.w) / 2).round.cint

const
    HINT_RENDER_SCALE_QUALITY = cstring("SDL_RENDER_SCALE_QUALITY")
    NEAREST = cstring("0")
    SCREEN_WIDTH_PIXELS = 128
    SCREEN_HEIGHT_PIXELS = 128
    TARGET_FPS = 60
    TARGET_DT = uint32(1 / TARGET_FPS * 1000)


type App = object
    shouldQuit: bool
    renderer: RendererPtr
    texture: TexturePtr
    scaleModePixelPerfect: bool


proc pollInput(app: var App) =
    var event = defaultEvent
    while pollEvent(event):
        case event.kind
        of QuitEvent:
            app.shouldQuit = true
        of KeyDown:
            if event.key.keysym.scancode == SDL_SCANCODE_ESCAPE:
              app.shouldQuit = true
        else:
            discard


type FileNotFoundError = object of Exception

proc initTexture(app: var App, path: string, renderer: RendererPtr) =
    let texture = renderer.loadTexture(path)
    if texture.isNil:
        raise FileNotFoundError.newException("File not found: " & path)
    app.texture = texture

func getDimens*(texture: TexturePtr): (int, int) =
    var w, h: cint
    var wPtr = addr w
    var hPtr = addr h
    texture.queryTexture(nil, nil, wPtr, hPtr)
    (int(w), int(h))

proc drawTexture(self: App) =
    let (w, h) = self.texture.getDimens

    for x in 0..SCREEN_WIDTH_PIXELS div w:
        for y in 0..SCREEN_HEIGHT_PIXELS div h:
            var drect = rect(cint(x * w), cint(y * h),
                             cint(w), cint(h))
            discard sdl2.copy(self.renderer,
                              self.texture, nil, addr drect)

proc render(self: App, renderTarget: TexturePtr,
            window: WindowPtr, debugFps: float) = 

    # SETUP
    self.renderer.setRenderTarget(renderTarget)
    self.renderer.clear()

    # ACTUALLY DO RENDERING
    # let fullScreenRect = rect(0, 0, SCREEN_WIDTH_PIXELS, SCREEN_HEIGHT_PIXELS)
    # self.renderer.setDrawColor(color(255, 0, 0, 255))
    # self.renderer.fillRect(unsafeAddr fullScreenRect)
    self.drawTexture()

    # SHOW
    let windowRect = window.getSize()
    let appScreenRect = point(SCREEN_WIDTH_PIXELS, SCREEN_HEIGHT_PIXELS)

    var drect = appScreenRect.scaleToFit(windowRect, self.scaleModePixelPerfect)

    self.renderer.setRenderTarget(nil)
    self.renderer.clear()
    self.renderer.copy(renderTarget, nil, addr drect)

    self.renderer.present()


proc loop(self: var App, dt: float) =
    discard


var frameTime: uint32 = 0
proc limitFrameRate() =
    let now = getTicks()
    if frameTime > now:
        delay(frameTime - now)
    frameTime += TARGET_DT


proc main(texturePath: string) =
    echo "Starting app from directory: " & getCurrentDir()

    sdlFailIf(not sdl2.init(INIT_VIDEO or INIT_TIMER or INIT_EVENTS)):
        "SDL2 initialization failed"
    defer: sdl2.quit()

    sdlFailIf(ttfInit() == SdlError): "SDL2 TTF initialization failed"
    defer: ttfQuit()

    const imgFlags: cint = IMG_INIT_PNG
    sdlFailIf(image.init(imgFlags) != imgFlags):
        "SDL2 Image initialization failed"
    defer: image.quit()

    echo "SDL2 initialized."

    let window = createWindow(title = "Palette Test",
        x = SDL_WINDOWPOS_CENTERED, y = SDL_WINDOWPOS_CENTERED,
        w = 1280, h = 720, flags = SDL_WINDOW_SHOWN or SDL_WINDOW_RESIZABLE)
    sdlFailIf window.isNil: "Window could not be created"
    defer: window.destroy()

    let renderer = window.createRenderer(index = -1,
        flags = Renderer_Accelerated)
    sdlFailIf renderer.isNil: "Renderer could not be created"
    defer: renderer.destroy()

    let renderTarget = createTexture(renderer, SDL_PIXELFORMAT_RGB888,
            TextureAccess.SDL_TEXTUREACCESS_TARGET,
            SCREEN_WIDTH_PIXELS, SCREEN_HEIGHT_PIXELS)
    defer: renderTarget.destroyTexture()

    if not sdl2.setHint(HINT_RENDER_SCALE_QUALITY, NEAREST):
        echo "Warning: unable to set texture filtering mode"

    var app = App(
        shouldQuit: false,
        scaleModePixelPerfect: true,
        renderer: renderer
    )

    app.initTexture(texturePath, renderer)

    # let font = openFontRW(
    #     staticReadRW("../assets/font/pixelated.ttf"), freesrc = 1, 8)

    # sdlFailIf font.isNil: "Failed to load font"

    var lastTime = epochTime()

    while not app.shouldQuit:
        let now = epochTime()
        let dt = now - lastTime
        lastTime = now
        let fps = 1 / dt

        app.pollInput()
        app.loop(dt)
        app.render(renderTarget, window, fps)

        limitFrameRate()

when isMainModule:
    if paramCount() < 1:
        echo "Enter texture to render as command-line argument"
    else:
        main(paramStr(1))

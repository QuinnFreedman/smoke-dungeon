import
    sdl2, 
    sdl2.image,
    os,
    times

import
    matrix,
    render,
    gamestate,
    render,
    textures,
    constants

type SDLException = object of Exception

template sdlFailIf(cond: typed, reason: string) =
    if cond: raise SDLException.newException(
        reason & ", SDL error: " & $getError())


proc toInput(key: Scancode): Input =
    case key
    of SDL_SCANCODE_A: Input.left
    of SDL_SCANCODE_D: Input.right
    of SDL_SCANCODE_W: Input.up
    of SDL_SCANCODE_S: Input.down
    of SDL_SCANCODE_LEFT: Input.left
    of SDL_SCANCODE_RIGHT: Input.right
    of SDL_SCANCODE_UP: Input.up
    of SDL_SCANCODE_DOWN: Input.down
    of SDL_SCANCODE_TAB: Input.tab
    else: Input.none


proc pollInput(game: var Game) =
    var event = defaultEvent
    while pollEvent(event):
        case event.kind
        of QuitEvent:
            game.shouldQuit = true
        of KeyDown:
            game.handleInput(event.key.keysym.scancode.toInput, true)
            if event.key.keysym.scancode == SDL_SCANCODE_ESCAPE:
                game.shouldQuit = true
        of KeyUp:
            game.handleInput(event.key.keysym.scancode.toInput, false)
        else:
            discard

proc render(game: Game) =
    # Draw over all drawings of the last frame with the default color
    game.renderer.clear()

    renderGameFrame(game)

    game.renderer.present()

const
    HINT_RENDER_SCALE_QUALITY = cstring("SDL_RENDER_SCALE_QUALITY")
    NEAREST = cstring("0")

proc main =
    echo "Starting game from directory: " & getCurrentDir()

    sdlFailIf(not sdl2.init(INIT_VIDEO or INIT_TIMER or INIT_EVENTS)):
        "SDL2 initialization failed"

    # defer blocks get called at the end of the procedure, even if an
    # exception has been thrown
    defer: sdl2.quit()
    
    const imgFlags: cint = IMG_INIT_PNG
    sdlFailIf(image.init(imgFlags) != imgFlags):
        "SDL2 Image initialization failed"
    defer: image.quit()

    let window = createWindow(title = "Smoke",
        x = SDL_WINDOWPOS_CENTERED, y = SDL_WINDOWPOS_CENTERED,
        w = 1280, h = 720, flags = SDL_WINDOW_SHOWN)
    sdlFailIf window.isNil: "Window could not be created"
    defer: window.destroy()

    let renderer = window.createRenderer(index = -1,
        flags = Renderer_Accelerated)
    sdlFailIf renderer.isNil: "Renderer could not be created"
    defer: renderer.destroy()

    # Set the default color to use for drawing
    # renderer.setDrawColor(r = 110, g = 132, b = 174)

    if renderer.setLogicalSize(cint(SCREEN_WIDTH_TILES * TILE_SIZE),
                               cint(SCREEN_HEIGHT_TILES * TILE_SIZE)) < 0:
        echo "Warning: unable to set renderer logical size"

    if not sdl2.setHint(HINT_RENDER_SCALE_QUALITY, NEAREST):
        echo "Warning: unable to set texture filtering mode"

    initTextures(renderer)

    var game = initGameData(renderer)

    var lastTime = epochTime()

    while not game.shouldQuit:
        let now = epochTime()
        let dt = now - lastTime
        lastTime = now
        game.pollInput()
        game.loop(dt)
        game.render()

main()

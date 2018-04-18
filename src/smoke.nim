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
    textures

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
    of SDL_SCANCODE_ESCAPE: Input.quit
    else: Input.none

proc handleInput(game: var Game) =
    var event = defaultEvent
    while pollEvent(event):
        case event.kind
        of QuitEvent:
            game.inputs[Input.quit] = true
        of KeyDown:
            game.inputs[event.key.keysym.scancode.toInput] = true
        of KeyUp:
            game.inputs[event.key.keysym.scancode.toInput] = false
        else:
            discard

proc render(game: var Game) =
    # Draw over all drawings of the last frame with the default color
    game.renderer.clear()

    renderGameFrame(game)

    game.renderer.present()


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

    sdlFailIf(not setHint("SDL_RENDER_SCALE_QUALITY", "2")):
        "Linear texture filtering could not be enabled"

    let window = createWindow(title = "Smoke",
        x = SDL_WINDOWPOS_CENTERED, y = SDL_WINDOWPOS_CENTERED,
        w = 1280, h = 720, flags = SDL_WINDOW_SHOWN)
    sdlFailIf window.isNil: "Window could not be created"
    defer: window.destroy()

    let renderer = window.createRenderer(index = -1,
        flags = Renderer_Accelerated or Renderer_PresentVsync)
    sdlFailIf renderer.isNil: "Renderer could not be created"
    defer: renderer.destroy()

    # Set the default color to use for drawing
    renderer.setDrawColor(r = 110, g = 132, b = 174)

    if renderer.setLogicalSize(cint(32 * 10), cint(32 * 5)) < 0:
        echo "Warning: unable to set renderer logical size"
    if not sdl2.setHint(HINT_RENDER_SCALE_QUALITY, NEAREST):
        echo "Warning: unable to set texture filtering mode"

    initTextures(renderer)

    var game = initGameData(renderer)

    var lastTime = epochTime()

    while not game.inputs[Input.quit]:
        let now = epochTime()
        let dt = now - lastTime
        lastTime = now
        game.handleInput()
        game.loop(dt)
        game.render()

main()
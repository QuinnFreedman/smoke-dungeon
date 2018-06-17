import
    system,
    sdl2

import
    types,
    utils,
    vector,
    render_utils,
    constants,
    keyboard

proc menuNode(name: string, children: varargs[Menu]): Menu =
    result = Menu(name: name, children: @children)
    for child in result.children:
        child.parent = result

proc menuLeaf(name: string, effect: proc(game: Game)): Menu =
    Menu(
        name: name,
        effect: proc(self: var Menu, game: Game) = effect(game)
    )

proc menuLeaf(name: string, effect:
              proc(self: var Menu, game: Game)): Menu =
    Menu(name: name, effect: effect)


proc initMenu*(prefs: Preferences): MainMenuScreen =
    proc scaleModeText(prefs: Preferences): string =
        if prefs.scaleModePixelPerfect:
            "Scale Mode:  Pixel Perfect"
        else:
            "Scale Mode:  Stretch"

    proc fullscreenText(prefs: Preferences): string =
        if prefs.fullscreen:
            "Fullscreen:  true"
        else:
            "Fullscreen:  false"

    result.root = menuNode("Menu",
        menuNode("Graphics",
            menuLeaf(prefs.scaleModeText, proc(self: var Menu, game: Game) =
                game.prefs.scaleModePixelPerfect = not game.prefs.scaleModePixelPerfect
                self.name = game.prefs.scaleModeText
            ),
            menuLeaf(prefs.fullscreenText, proc(self: var Menu, game: Game) =
                game.prefs.fullscreen = not game.prefs.fullscreen
                self.name = game.prefs.fullscreenText

                discard game.window.setFullscreen(if game.prefs.fullscreen: SDL_WINDOW_FULLSCREEN_DESKTOP else: 0)
            )
        ),
        menuLeaf("Exit", proc(game: Game) = game.shouldQuit = true)
    )
    result.active = result.root


proc loopMenu*(game: Game): ScreenChange =
    alias menu: game.mainMenu
    let keyboard = game.keyboard
    let moveY =
        if keyboard.keyPressed(Input.down): 1
        elif keyboard.keyPressed(Input.up): -1
        else: 0

    menu.cursor = (menu.cursor + moveY) %% menu.active.children.len

    if keyboard.keyPressed(Input.enter):
        alias selected: menu.active.children[menu.cursor]
        if not selected.effect.isNil:
            selected.effect(selected, game)
        if not (selected.children.isNil or selected.children.len == 0):
            menu.active = selected
            menu.cursor = 0

    if keyboard.keyPressed(Input.back):
        if menu.active.parent.isNil:
            return ScreenChange(changeTo: menu.previousScreen)
        else:
            menu.active = menu.active.parent
            menu.cursor = 0

    if keyboard.keyPressed(Input.menu):
        return ScreenChange(changeTo: menu.previousScreen)


proc renderMenu(game: Game, position: Vec2) =
    let menu = game.mainMenu
    const lineSpacing = 12
    renderText(game.renderInfo, menu.active.name, position, WHITE)
    var i = 0
    for child in menu.active.children:
        let yOffset = (i + 1) * lineSpacing
        renderText(game.renderInfo, child.name, position + v(8, yOffset), WHITE)
        if i == game.mainMenu.cursor:
            renderText(game.renderInfo, "*",
                       position + v(0, yOffset), WHITE)

        inc(i)


proc renderMainMenu*(game: Game) =
    # let renderer = game.renderInfo.renderer
    # let oldTarget = renderer.getRenderTarget()
    # let menuTexture = createTexture(
    #         renderer, SDL_PIXELFORMAT_RGB888,
    #         TextureAccess.SDL_TEXTUREACCESS_TARGET,
    #         SCREEN_WIDTH_PIXELS div 2, SCREEN_HEIGHT_PIXELS)
    renderMenu(game, v(0, 0))

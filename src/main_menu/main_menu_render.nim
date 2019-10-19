import
    system

import
    ../types,
    ../render_utils,
    ../vector

func renderMenu(game: Game, position: Vec2) =
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


func renderMainMenu*(game: Game) =
    # let renderer = game.renderInfo.renderer
    # let oldTarget = renderer.getRenderTarget()
    # let menuTexture = createTexture(
    #         renderer, SDL_PIXELFORMAT_RGB888,
    #         TextureAccess.SDL_TEXTUREACCESS_TARGET,
    #         SCREEN_WIDTH_PIXELS div 2, SCREEN_HEIGHT_PIXELS)
    renderMenu(game, v(0, 0))

import
    sdl2,
    patty,
    math

import
    types,
    keyboard,
    vector,
    game_utils,
    inventory/inventory_render,
    inventory/inventory_logic,
    combat/combat_logic,
    combat/combat_render,
    character_utils,
    direction,
    render_utils,
    matrix,
    utils,
    constants,
    main_menu/main_menu_logic,
    main_menu/main_menu_render,
    world/world_logic,
    world/world_render,
    combat_transition/transition_render,
    combat_transition/transition_logic


proc loop*(self: var Game, dt: float) =
    let wasInMenu = self.screen == Screen.menu
    let screenChange =
        if self.keyboard.keyPressed(Input.menu) and not wasInMenu:
            ScreenChange(changeTo: Screen.menu, previousScreen: self.screen)
        else:
            case self.screen
            of Screen.world:
                loopMainGame(self.gameState, self.keyboard, dt)
            of Screen.inventory:
                loopInventory(self.inventory, self.gamestate.playerParty, self.keyboard)
            of Screen.combat:
                updateCombatScreen(self.combat, self.gameState.level, self.keyboard, dt)
            of Screen.menu:
                loopMenu(self)
            of Screen.transition:
                loopTransition(self.combatTransition, dt)
            of Screen.none:
                ScreenChange(changeTo: Screen.none)

    if screenChange.changeTo != Screen.none:
        self.screen = screenChange.changeTo

    # Don't re-init screen if coming from menu
    if not wasInMenu:
        match screenChange:
            # TODO: put init functions in modules
            inventory(items: items):
                for i in 0..<items.len:
                    alias ground: self.inventory.ground
                    ground[i div ground.width, i mod ground.width] = items[i]
            combat(playerParty: playerParty, enemyParty: enemyParty):
                self.combat.playerParty = playerParty
                self.combat.enemyParty = enemyParty
            menu(previousScreen: previousScreen):
                self.mainMenu.previousScreen = previousScreen
                self.mainMenu.cursor = 0
                self.mainMenu.active = self.mainMenu.root
            transition(startWindow: start, endWindow: dest, whenDone: whenDone):
                initTransition(self.combatTransition, start, dest, whenDone)
            _: discard


    self.resetInputs()


func scaleToFit(rect, bounds: Point, intScale: bool = false): Rect =
    var scale = min(bounds.x / rect.x, bounds.y / rect.y)

    if intScale:
        scale = scale.floor

    result.w = (rect.x.float * scale).round.cint
    result.h = (rect.y.float * scale).round.cint

    result.y = ((bounds.y - result.h) / 2).round.cint
    result.x = ((bounds.x - result.w) / 2).round.cint


var avgFps: float = 0

proc render*(self: Game, renderTarget: TexturePtr,
             window: WindowPtr, debugFps: float) =

    if debugFps < 1000:
        avgFps = 0.9 * avgFps + 0.1 * debugFps

    self.renderer.setRenderTarget(renderTarget)
    self.renderer.clear()

    case self.screen
    of Screen.world:
        renderGameFrame(self.gameState, self.renderer)
    of Screen.inventory:
        renderInventory(self.inventory,
                        self.gamestate.playerParty,
                        self.renderInfo)
    of Screen.combat:
        renderCombatScreen(self.gameState, self.combat, self.renderInfo)
    of Screen.transition:
        renderTransitionScreen(self.combatTransition,
                               self.gameState,
                               self.renderInfo)
    of Screen.menu:
        renderMainMenu(self)
    of Screen.none:
        discard

    renderText(self.renderInfo, "fps: " & $avgFps,
               v(SCREEN_WIDTH_PIXELS - 80, 0), color(255,255,255,255))



    let windowRect = window.getSize()
    let gameScreenRect = point(SCREEN_WIDTH_PIXELS, SCREEN_HEIGHT_PIXELS)

    var drect = gameScreenRect.scaleToFit(windowRect, self.prefs.scaleModePixelPerfect)

    self.renderer.setRenderTarget(nil)
    self.renderer.clear()
    self.renderer.copy(renderTarget, nil, addr drect)


    self.renderer.present()

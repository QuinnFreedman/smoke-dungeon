import
    sdl2,
    patty,
    math

import
    types,
    keyboard,
    vector,
    game_utils,
    inventory,
    combat,
    character_utils,
    direction,
    render_world,
    render_utils,
    matrix,
    utils,
    constants,
    main_menu

proc moveOrSwap(pc: Character, party: seq[Character],
                level: var Level, direction: Direction) =
    let tile = pc.currentTile + directionVector(direction)
    if level.collision.contains(tile) and level.collision[tile] > uint8(0):
        for ally in party:
            if not ally.isMoving and ally.currentTile == tile:
                ally.nextTile = pc.currentTile
                ally.facing = tile.directionTo(pc.currentTile)
                pc.nextTile = ally.currentTile
                pc.facing = direction
    else:
        pc.move(direction, level.collision)

proc loopMainGame(gameState: var GameState,
                  keyboard: Keyboard, dt: float): ScreenChange =
    if keyboard.keyPressed(Input.tab):
        result = ScreenChange(changeTo: Screen.inventory)

    let pc = gamestate.playerParty[0]
    # for entity in gameState.entities:
    #     if entity.health > 0 and not (entity in gameState.playerParty):
    #         if distance(pc.currentTile, entity.currentTile) <= 1.0 or
    #                 distance(pc.currentTile, entity.nextTile) <= 1.0:
    #             echo "combat with: " & $entity
    #             return ScreenChange(
    #                 changeTo: Screen.combat,
    #                 playerParty: gameState.playerParty,
    #                 enemyParty: @[entity]
    #             )



    if not pc.isMoving:
        if keyboard.keyDown(Input.up):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.up)
        if keyboard.keyDown(Input.down):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.down)
        if keyboard.keyDown(Input.left):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.left)
        if keyboard.keyDown(Input.right):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.right)

    # if keyboar.keyDown(Input.enter):
    #     if not pc.isMoving:
    #         for character in gameState.entities:
    #             if character.health == 0 and
    #                     character.currentTile == pc.currentTile:
    #                 result = Screen.inventory


    for entity in gameState.entities:
        entity.loopAI(gamestate.entities, gamestate.level)
        entity.update(gamestate.level, dt)


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
            of Screen.none:
                ScreenChange(changeTo: Screen.none)

    if screenChange.changeTo != Screen.none:
        self.screen = screenChange.changeTo

    # Don't re-init screen if coming from menu
    if not wasInMenu:
        match screenChange:
            inventory(items: items):
                if not items.isNil:
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
            _: discard


    self.resetInputs()


proc scaleToFit(rect, bounds: Point, intScale: bool = false): Rect =
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

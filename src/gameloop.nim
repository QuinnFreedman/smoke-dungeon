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
    constants

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
    let screenChange =
        case self.screen
        of Screen.world:
            loopMainGame(self.gameState, self.keyboard, dt)
        of Screen.inventory:
            loopInventory(self.inventory, self.gamestate.playerParty, self.keyboard)
        of Screen.combat:
            updateCombatScreen(self.combat, self.gameState.level, self.keyboard, dt)
        of Screen.none:
            ScreenChange(changeTo: Screen.none)

    if screenChange.changeTo != Screen.none:
        self.screen = screenChange.changeTo
    match screenChange:
        inventory(items: items):
            if not items.isNil:
                for i in 0..<items.len:
                    alias ground: self.inventory.ground
                    ground[i div ground.width, i mod ground.width] = items[i]
        combat(playerParty: playerParty, enemyParty: enemyParty):
            self.combat.playerParty = playerParty
            self.combat.enemyParty = enemyParty
        _: discard


    self.resetInputs()


proc scaleToFit(rect, bounds: Point): Rect =
    let rectRatio = rect.x / rect.y
    let boundsRatio = bounds.x / bounds.y

    # Rect is more landscape than bounds - fit to width
    if rectRatio > boundsRatio:
        result.w = bounds.x
        result.h = (rect.y.float * (bounds.x / rect.x)).round.cint
    # Rect is more portrait than bounds - fit to height
    else:
        result.w = (rect.x.float * (bounds.y / rect.y)).round.cint
        result.h = bounds.y

    result.y = ((bounds.y - result.h) / 2).round.cint
    result.x = ((bounds.x - result.w) / 2).round.cint



proc render*(self: Game, renderTarget: TexturePtr,
             window: WindowPtr, debugFps: float) =
    ## main render loop for the game

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
    of Screen.none:
        discard

    # renderText(self.renderer, self.font, "fps: " & $debugFps,
    #            100.cint, 100.cint, color(255,255,255,255), self.textCache)



    let windowRect = window.getSize()
    let gameScreenRect = point(SCREEN_WIDTH_PIXELS, SCREEN_HEIGHT_PIXELS)

    var drect = gameScreenRect.scaleToFit(windowRect)

    self.renderer.setRenderTarget(nil)
    self.renderer.copy(renderTarget, nil, addr drect)


    self.renderer.present()

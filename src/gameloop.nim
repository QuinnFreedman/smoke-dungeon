import sdl2

import
    vector,
    gamestate,
    inventory,
    combat,
    character,
    direction,
    render,
    render_utils


proc loopMainGame(gameState: var GameState, combatInfo: var CombatScreen,
                  keyboard: Keyboard, dt: float): Screen =
    if keyboard.keyPressed(Input.tab):
        result = Screen.inventory
    else:
        result = Screen.world

    let pc = gamestate.playerParty[0]
    for entity in gameState.entities:
        if not (entity in gameState.playerParty):
            if distance(pc.currentTile, entity.currentTile) <= 1.0 or
                    distance(pc.currentTile, entity.nextTile) <= 1.0:
                result = Screen.combat
                echo "combat with: " & $entity.race
                combatInfo.playerParty = gameState.playerParty
                combatInfo.enemyParty = @[entity]
                return

    if keyboard.keyDown(Input.up):
        pc.move(Direction.up, gamestate.level.walls)
    if keyboard.keyDown(Input.down):
        pc.move(Direction.down, gamestate.level.walls)
    if keyboard.keyDown(Input.left):
        pc.move(Direction.left, gamestate.level.walls)
    if keyboard.keyDown(Input.right):
        pc.move(Direction.right, gamestate.level.walls)

    for entity in gameState.entities:
        entity.update(gamestate.level, dt)


proc loop*(self: var Game, dt: float) =
    self.screen =
        case self.screen
        of Screen.world:
            loopMainGame(self.gameState, self.combat, self.keyboard, dt)
        of Screen.inventory:
            loopInventory(self.inventory, self.gamestate.playerParty, self.keyboard)
        of Screen.combat:
            updateCombatScreen(self.combat, self.gameState.level, self.keyboard, dt)

    self.resetInputs()


proc render*(self: Game, debugFps: float) =
    ## main render loop for the game

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

    # renderText(self.renderer, self.font, "fps: " & $debugFps,
    #            100.cint, 100.cint, color(255,255,255,255), self.textCache)
    self.renderer.present()

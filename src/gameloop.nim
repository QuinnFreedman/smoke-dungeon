import sdl2

import
    gamestate,
    inventory,
    combat,
    character,
    direction,
    render,
    render_utils


proc loopMainGame(gameState: var GameState,
                  keyboard: Keyboard, dt: float): Screen =
    if keyboard.keyPressed(Input.tab):
        result = Screen.inventory
    else:
        result = Screen.world

    if keyboard.keyDown(Input.up):
        gameState.playerParty[0].move(Direction.up, gamestate.level.walls)
    if keyboard.keyDown(Input.down):
        gameState.playerParty[0].move(Direction.down, gamestate.level.walls)
    if keyboard.keyDown(Input.left):
        gameState.playerParty[0].move(Direction.left, gamestate.level.walls)
    if keyboard.keyDown(Input.right):
        gameState.playerParty[0].move(Direction.right, gamestate.level.walls)

    for entity in gameState.entities:
        entity.update(gamestate.level, dt)


proc loop*(self: var Game, dt: float) =
    self.screen =
        case self.screen
        of Screen.world:
            loopMainGame(self.gameState, self.keyboard, dt)
        of Screen.inventory:
            loopInventory(self.inventory, self.gamestate.playerParty, self.keyboard)
        of Screen.combat:
            updateCombatScreen(self.combat, self.keyboard, dt)

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
        renderCombatScreen(self.combat, self.renderer)

    # renderText(self.renderer, self.font, "fps: " & $debugFps,
    #            100.cint, 100.cint, color(255,255,255,255), self.textCache)
    self.renderer.present()

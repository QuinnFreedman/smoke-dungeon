import sdl2

import
    gamestate,
    inventory,
    character,
    direction,
    render,
    render_utils

proc loopMainGame(self: var Game, dt: float) =
    if self.keyPressed(Input.tab):
        self.screen = Screen.inventory

    if self.keyDown(Input.up):
        self.gameState.playerParty[0].move(Direction.up,
                                           self.gamestate.level.walls)
    if self.keyDown(Input.down):
        self.gameState.playerParty[0].move(Direction.down,
                                           self.gamestate.level.walls)
    if self.keyDown(Input.left):
        self.gameState.playerParty[0].move(Direction.left,
                                           self.gamestate.level.walls)
    if self.keyDown(Input.right):
        self.gameState.playerParty[0].move(Direction.right,
                                           self.gamestate.level.walls)

    for i in 0..<self.gameState.playerParty.len:
        if not self.gameState.playerParty[i].isNil:
            (self.gameState.playerParty[i][]).doLogic(self.gameState.level)

    for i in 0..<self.gameState.playerParty.len:
        if not self.gameState.playerParty[i].isNil:
            self.gameState.playerParty[i][].update(dt)


proc loop*(self: var Game, dt: float) =
    case self.screen
    of Screen.world:
        loopMainGame(self, dt)
    of Screen.inventory:
        loopInventory(self)

    self.resetInputs()


proc render*(self: Game, debugFps: float) =
    ## main render loop for the game

    self.renderer.clear()

    case self.screen
    of Screen.world:
        renderGameFrame(self)
    of Screen.inventory:
        renderInventory(self)

    renderText(self.renderer, self.font, "fps: " & $debugFps,
               100.cint, 100.cint, color(255,255,255,255), self.textCache)
    self.renderer.present()

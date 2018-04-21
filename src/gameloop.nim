import sdl2

import
    gamestate,
    inventory,
    character,
    direction,
    render

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
        if not self.gameState.playerParty[i].isNone:
            self.gameState.playerParty[i].update(dt)


proc loop*(self: var Game, dt: float) =
    case self.screen
    of Screen.world:
        loopMainGame(self, dt)
    of Screen.inventory:
        loopInventory(self)
    
    self.resetInputs()


proc render*(self: Game) =
    ## main render loop for the game

    # Draw over all drawings of the last frame with the default color
    self.renderer.clear()

    case self.screen
    of Screen.world:
        renderGameFrame(self)
    of Screen.inventory:
        renderInventory(self)

    self.renderer.present()

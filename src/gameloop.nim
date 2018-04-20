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
        self.gameState.playerCharacter.move(Direction.up,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.down):
        self.gameState.playerCharacter.move(Direction.down,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.left):
        self.gameState.playerCharacter.move(Direction.left,
                                            self.gamestate.level.walls)
    if self.keyDown(Input.right):
        self.gameState.playerCharacter.move(Direction.right,
                                            self.gamestate.level.walls)
        
    self.gameState.playerCharacter.update(dt)


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
        renderInventory(self.gameState.playerCharacter, self.renderer)

    self.renderer.present()

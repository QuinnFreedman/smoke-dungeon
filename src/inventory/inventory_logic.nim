import sdl2

import
    ../keyboard,
    ../matrix,
    ../types,
    ../utils,
    ../vector,
    inventory_utils

func loopInventory*(inv: var Inventory, playerParty: seq[Character],
                    keyboard: Keyboard): ScreenChange =
    if keyboard.keyPressed(Input.tab):
        result = ScreenChange(changeTo: Screen.world)

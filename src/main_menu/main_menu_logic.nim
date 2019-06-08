
import
    ../types,
    ../utils,
    ../keyboard


proc loopMenu*(game: Game): ScreenChange =
    alias menu: game.mainMenu
    let keyboard = game.keyboard
    let moveY =
        if keyboard.keyPressed(Input.down): 1
        elif keyboard.keyPressed(Input.up): -1
        else: 0

    menu.cursor = (menu.cursor + moveY) %% menu.active.children.len

    if keyboard.keyPressed(Input.enter):
        alias selected: menu.active.children[menu.cursor]
        if not selected.effect.isNil:
            selected.effect(selected, game)
        if selected.children.len != 0:
            menu.active = selected
            menu.cursor = 0

    if keyboard.keyPressed(Input.back):
        if menu.active.parent.isNil:
            return ScreenChange(changeTo: menu.previousScreen)
        else:
            menu.active = menu.active.parent
            menu.cursor = 0

    if keyboard.keyPressed(Input.menu):
        return ScreenChange(changeTo: menu.previousScreen)

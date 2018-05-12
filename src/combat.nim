import
    sdl2,
    sequtils

import
    matrix,
    vector,
    character,
    gamestate,
    constants,
    algorithm,
    utils,
    render,
    render_utils,
    render_character,
    textures,
    astar,
    level

proc getCombatWindow(combat: CombatScreen): Rect =
    const radiusX = 3
    const radiusY = 2

    newSdlRect(combat.center.x - radiusX,
            combat.center.y - radiusY,
            2 * radiusX + 1, 2 * radiusY + 1)

proc renderCombatScreen*(gameState: GameState,
                         info: CombatScreen,
                         renderer: RendererPtr) =

    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    let transform = round(
        (vecFloat(info.center) + vf(0.5, 0.5))
            .scale(float(-TILE_SIZE)) + screenCenter)

    let window = getCombatWindow(info)

    renderMap(gameState.level.textures, window, renderer, transform)

    if info.state == CombatState.pickingMovement:
        drawImage(TextureAlias.mapCursor, info.mapCursor.scale(TILE_SIZE),
                  renderer, transform)

    for character in info.turnOrder:
        renderCharacter(character, renderer, transform)


proc setupCombat(info: var CombatScreen) =
    info.turnOrder = concat(info.playerParty, info.enemyParty)
    info.turnOrder.sort do (a, b: Character) -> int:
        result = cmp(a.getInitiative, b.getInitiative)

    # TODO this should be the average of all entities in the combat
    info.center = info.playerParty[0].currentTile
    info.state = CombatState.waiting
    info.turn = 0
    info.menuCursor = 0

    #TODO
    info.mapCursor = info.turnOrder[0].currentTile
    info.state = CombatState.pickingMovement

proc updateCombatScreen*(combat: var CombatScreen,
                         level: Level,
                         keyboard: Keyboard,
                         dt: float): Screen =
    result = Screen.combat
    if combat.turnOrder.isNil:
        setupCombat(combat)

    template activeChar: untyped = combat.turnOrder[combat.turn]

    let moveY =
        if keyboard.keyPressed(Input.up): -1
        elif keyboard.keyPressed(Input.down): 1
        else: 0

    let moveX =
        if keyboard.keyPressed(Input.left): -1
        elif keyboard.keyPressed(Input.right): 1
        else: 0

    let enterPressed = keyboard.keyPressed(Input.enter)

    # combat.turn = (combat.turn + 1) mod combat.turnOrder.len

    case combat.state
    of CombatState.pickingMovement:
        let window = getCombatWindow(combat)
        combat.mapCursor.x = clamp(combat.mapCursor.x + moveX,
                                   window.x, window.x + window.w)
        combat.mapCursor.y = clamp(combat.mapCursor.y + moveY,
                                   window.y, window.y + window.h)
        if enterPressed: combat.state = CombatState.waiting
    of CombatState.waiting:
        #TODO follow path
        if combat.path.isNil:
            combat.path = aStarSearch(level.walls,
                                      activeChar.currentTile,
                                      combat.mapCursor, 0)
            if combat.path.len == 0:
                combat.state = CombatState.pickingMovement
                return
            discard combat.path.pop
            echo "path from " & $activeChar.currentTile & " to " & $combat.mapCursor & ": " & $combat.path
        if not activeChar.isMoving:
            echo combat.path
            if combat.path.len == 0:
                combat.state = CombatState.pickingMovement
                combat.path = nil
            else:
                let nextTile = combat.path.pop()
                activeChar.moveToward(nextTile, level.walls)

        activeChar.update(level, dt)

    else: discard #TODO implement other states

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
    level,
    ability

proc getCombatWindow(combat: CombatScreen): Rect =
    const radiusX = 3
    const radiusY = 2

    newSdlRect(combat.center.x - radiusX,
            combat.center.y - radiusY,
            2 * radiusX + 1, 2 * radiusY + 1)


const MENU_LOCATION = v(100, 100)

template drawMenu(abilities: untyped, renderInfo: RenderInfo) =
    ## abilities should be an iterator
    ## this has to be a template because iterators are not fist class
    var i = 0
    for ability in abilities:
        renderText(renderInfo, ability.name,
                   MENU_LOCATION + v(0, i * 12),
                   color(r=255, g=255, b=255, a=255))
        inc(i)

proc renderCombatScreen*(gameState: GameState,
                         combat: CombatScreen,
                         renderInfo: RenderInfo) =

    template activeChar: untyped = combat.turnOrder[combat.turn]

    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    let transform = round(
        (vecFloat(combat.center) + vf(0.5, 0.5))
            .scale(float(-TILE_SIZE)) + screenCenter)

    let window = getCombatWindow(combat)

    renderMap(gameState.level.textures, window, renderInfo.renderer, transform)

    case combat.state
    of CombatState.pickingMovement:
        drawImage(TextureAlias.mapCursor, combat.mapCursor.scale(TILE_SIZE),
                  renderInfo.renderer, transform)
    of CombatState.pickingAbility:
        drawMenu(activeChar.iterAbilities(), renderInfo)
    else: discard

    for character in combat.turnOrder:
        renderCharacter(character, renderInfo.renderer, transform)


proc setupCombat(info: var CombatScreen) =
    info.turnOrder = concat(info.playerParty, info.enemyParty)
    info.turnOrder.sort do (a, b: Character) -> int:
        result = cmp(a.getInitiative, b.getInitiative)

    # TODO this should be the average of all entities in the combat
    info.center = info.playerParty[0].currentTile
    info.state = CombatState.waiting
    info.turn = 0

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
                                      combat.mapCursor, 1)
            if combat.path.len == 0:
                combat.state = CombatState.pickingMovement
                return
            discard combat.path.pop
            echo "path from " & $activeChar.currentTile & " to " & $combat.mapCursor & ": " & $combat.path
        if not activeChar.isMoving:
            echo combat.path
            if combat.path.len == 0:
                combat.path = nil
                combat.state = CombatState.pickingAbility
                combat.menuCursor = 0
            else:
                let nextTile = combat.path.pop()
                activeChar.moveToward(nextTile, level.walls)

        if activeChar.isMoving:
            activeChar.update(level, dt)

    of CombatState.pickingAbility:
        combat.menuCursor =
            (combat.menuCursor + moveY) mod activeChar.numAbilites
        if enterPressed:
            combat.activeAbility = activeChar.getAbility(combat.menuCursor)
            combat.state = CombatState.pickingWeapon



    else: discard #TODO implement other states

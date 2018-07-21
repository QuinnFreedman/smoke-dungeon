import
    sdl2,
    math

import
    combat_utils,
    ../constants,
    ../matrix,
    ../render_character,
    ../render_map,
    ../render_utils,
    ../textures,
    ../types,
    ../utils,
    ../vector,
    ../character_utils

proc renderHorizontalBar(pos: Vec2, width: int, value: float, color: Color,
                         renderInfo: RenderInfo, transform: Vec2)=

    let length = (value * (TILE_SIZE.float - 4)).round.cint
    fillRect(rect(pos.x.cint, pos.y.cint, length, width.cint), color,
             renderInfo.renderer, transform)


proc renderCharacterVitals(character: Character,
                           renderInfo: RenderInfo, transform: Vec2) =
    if character.health <= 0: return
    let upperLeft = character.actualPos.scale(TILE_SIZE).round()

    let maxHealth = character.get(Stat.maxHp)
    if maxHealth != 0:
         renderHorizontalBar(upperLeft + v(2, 2), 2,
                character.health / maxHealth, RED,
                renderInfo, transform)

    # if character.maxMana != 0:
    #      renderHorizontalBar(upperLeft + v(2, 4), 2,
    #             character.mana / character.maxMana, BLUE,
    #             renderInfo, transform)
    #
    # if character.maxEnergy != 0:
    #      renderHorizontalBar(upperLeft + v(2, 4), 2,
    #             character.energy / character.maxEnergy,
    #             color(200, 200, 0, 255),
    #             renderInfo, transform)

const MENU_LOCATION = v(50, 100)


proc drawMessage(message: string, renderInfo: RenderInfo) =
    if not message.isNil:
        #TODO line wrapping
        renderText(renderInfo, message, MENU_LOCATION, WHITE)

template drawMenu(message: string, namedItems: untyped,
                  cursor: int, renderInfo: RenderInfo) =
    drawMessage(message, renderInfo)
    const lineSpacing = 12
    var i = 0
    for thing in namedItems:
        let yOffset = (i + 1) * lineSpacing
        renderText(renderInfo, thing.name,
                   MENU_LOCATION + v(8, yOffset), WHITE)
        if i == cursor:
            renderText(renderInfo, "*",
                       MENU_LOCATION + v(0, yOffset), WHITE)

        inc(i)

proc drawMapCursor(mapCursor: Vec2, renderInfo: RenderInfo, transform: Vec2) {.inline.} =
    drawImage(TextureAlias.mapCursor, mapCursor.scale(TILE_SIZE),
              renderInfo.renderer, transform)

proc drawMapMarker(mapCursor: Vec2, renderInfo: RenderInfo, transform: Vec2) {.inline.} =
    drawImage(TextureAlias.mapMarker, mapCursor.scale(TILE_SIZE),
              renderInfo.renderer, transform)


proc renderCombatScreen*(gameState: GameState,
                         combat: CombatScreen,
                         renderInfo: RenderInfo) =

    alias activeChar: combat.turnOrder[combat.turn]

    let screenCenter = v(SCREEN_WIDTH_TILES, SCREEN_HEIGHT_TILES)
                               .scale(TILE_SIZE / 2)
    let transform = round(
        (vecFloat(combat.center) + vf(0.5, 0.5))
            .scale(float(-TILE_SIZE)) + screenCenter)

    let window = getCombatWindow(combat)

    # Render map
    renderMap(gameState.level, window, renderInfo.renderer, transform, fow=false)

    for p in combat.aoeAuras.indices:
        if gameState.level.walls.contains(p) and not gameState.level.walls[p]:
            let aura = combat.aoeAuras[p]
            drawImage(aura.texture, p.scale(TILE_SIZE),
                      renderInfo.renderer, transform)

    # Render markers and cursors
    case combat.state
    of CombatState.pickingMovement:
        drawMapMarker(activeChar.currentTile, renderInfo, transform)
        drawMapCursor(combat.mapCursor, renderInfo, transform)
    of CombatState.pickingAbility:
        drawMapMarker(activeChar.currentTile, renderInfo, transform)
    of CombatState.pickingTarget:
        drawMapMarker(activeChar.currentTile, renderInfo, transform)
        drawMapCursor(combat.mapCursor, renderInfo, transform)
    else: discard

    # Render characters
    for character in combat.turnOrder:
        renderCharacterVitals(character, renderInfo, transform)
        renderCharacter(character, renderInfo.renderer, transform)

    # Render text
    case combat.state
    of CombatState.pickingMovement:
        if combat.message.isNil:
            drawMessage("Move where?", renderInfo)
        else:
            drawMessage(combat.message, renderInfo)
    of CombatState.pickingAbility:
        if not combat.message.isNil:
            drawMessage(combat.message, renderInfo)
        else:
            drawMenu("Do what?", activeChar.iterAbilities(), combat.menuCursor, renderInfo)
    of CombatState.pickingTarget:
        if not combat.message.isNil:
            drawMessage(combat.message, renderInfo)
        else:
            drawMessage("Pick target", renderInfo)
    else: discard

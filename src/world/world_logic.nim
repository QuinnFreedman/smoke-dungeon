import
    ../character_utils,
    ../constants,
    ../combat/combat_utils,
    ../direction,
    ../keyboard,
    ../matrix,
    ../shadowcasting,
    ../types,
    ../utils,
    ../vector,
    world_utils

proc moveOrSwap(pc: Character, party: seq[Character],
                level: var Level, direction: Direction) =
    let tile = pc.currentTile + directionVector(direction)
    if level.collision.contains(tile) and level.collision[tile] > uint8(0):
        for ally in party:
            if not ally.isMoving and ally.currentTile == tile:
                ally.nextTile = pc.currentTile
                ally.facing = tile.directionTo(pc.currentTile)
                pc.nextTile = ally.currentTile
                pc.facing = direction
    else:
        pc.move(direction, level.collision)


proc loopMainGame*(gameState: var GameState,
                   keyboard: Keyboard, dt: float): ScreenChange =
    if keyboard.keyPressed(Input.tab):
        result = ScreenChange(changeTo: Screen.inventory)

    let pc = gamestate.playerParty[0]
    for entity in gameState.entities:
        if entity.health > 0 and not (entity in gameState.playerParty):
            if distance(pc.currentTile, entity.currentTile) <= 1.0 or
                    distance(pc.currentTile, entity.nextTile) <= 1.0:
                echo "combat with: " & $entity
                let enemyParty = @[entity]
                let playerParty = gameState.playerParty
                let window = getRenderWindow(pc.currentTile, pc.nextTile)
                return ScreenChange(
                    changeTo: Screen.transition,
                    startWindow: window,
                    endWindow: getCombatWindow(playerParty, enemyParty),
                    whenDone: makeRef(ScreenChange(
                        changeTo: Screen.combat,
                        playerParty: playerParty,
                        enemyParty: enemyParty
                    ))
                )


    if not pc.isMoving:
        if keyboard.keyDown(Input.up):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.up)
        if keyboard.keyDown(Input.down):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.down)
        if keyboard.keyDown(Input.left):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.left)
        if keyboard.keyDown(Input.right):
            pc.moveOrSwap(gamestate.playerParty, gamestate.level, Direction.right)

    # if keyboar.keyDown(Input.enter):
    #     if not pc.isMoving:
    #         for character in gameState.entities:
    #             if character.health == 0 and
    #                     character.currentTile == pc.currentTile:
    #                 result = Screen.inventory


    for entity in gameState.entities:
        entity.loopAI(gamestate.entities, gamestate.level)
        entity.update(gamestate.level, dt)

    alias level: gameState.level
    let window = getRenderWindow(pc.currentTile, pc.nextTile)

    level.shadowMask1.recycle(window.w, window.h,
                              v(window.x, window.y))
    level.shadowMask2.recycle(window.w, window.h,
                              v(window.x, window.y))

    shadowCast(pc.currentTile, level.shadowMask1, level.walls, FOV_RADIUS)
    shadowCast(pc.nextTile, level.shadowMask2, level.walls, FOV_RADIUS)

    if FOG_OF_WAR:
        for v in level.shadowMask1.indices:
            if level.seen.contains(v):
                level.seen[v] = level.seen[v] or not level.shadowMask1[v] or not level.shadowMask2[v]

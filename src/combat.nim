import
    sdl2,
    sequtils

import
    character,
    gamestate,
    constants,
    algorithm,
    matrix

proc getPreviewRect(ally, frontLine: bool, col: int): Rect =
    let x = 50 + col * (TILE_SIZE + 8)
    let y =
        if ally:
            100 + (TILE_SIZE * -int(frontline))
        else:
            50 + (TILE_SIZE * int(frontline))

    rect(x.cint, y.cint, TILE_SIZE)

proc renderCombatScreen*(info: CombatScreen, renderer: RendererPtr) =
    renderer.setDrawColor(r = 100, g = 255, b = 255)
    renderer.clear()


proc setupCombat(info: var CombatScreen) =
    info.turnOrder = concat(info.playerParty, info.enemyParty)
    info.turnOrder.sort do (a, b: Character) -> int:
        result = cmp(a.getInitiative, b.getInitiative)

    for party in [(info.playerParty, info.playerPartyMatrix),
                  (info.enemyParty, info.enemyPartyMatrix)]:
        #TODO this probably wont work, use an alias
        var (list, matrix) = party

        let positions = zip(list, toSeq(matrix.indices))
        for pos in positions:
            let (character, matrixIndex) = pos
            matrix[matrixIndex] = character


proc updateCombatScreen*(info: var CombatScreen,
                         keyboard: Keyboard,
                         dt: float): Screen =
    result = Screen.combat
    if not info.setupDone:
        setupCombat(info)

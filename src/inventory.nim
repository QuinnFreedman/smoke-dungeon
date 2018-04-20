import sdl2

import
    matrix,
    vector,
    utils,
    constants,
    character,
    render_utils,
    textures,
    clothing,
    gamestate

proc renderCharacterFullPreview(character: Character, pos: Vec2,
                                renderer: RendererPtr, transform: Vec2) =
    let srcRect = character.getStaticSrcRect

    drawTile(character.spritesheet, srcRect, pos, renderer, transform)

    for item in character.clothes:
        drawTile(item.getTexture(character.sex), srcRect, pos,
                 renderer, transform)


proc renderCharacterCroppedPreview(character: Character, pos: Vec2,
                                   renderer: RendererPtr, transform: Vec2) =
    let h = TILE_SIZE - 6
    var srcRect = newSdlRect(0, 0, TILE_SIZE, h)
    var destRect = newSdlRect(pos.x, pos.y, TILE_SIZE, h)

    drawImage(character.spritesheet, srcRect, destRect, renderer, transform)
    for item in character.clothes:
        drawImage(item.getTexture(character.sex), srcRect, destRect,
                  renderer, transform)

const mainPreviewRect = v(18, 8)
const previewRects = [
    v(61, 11),
]

proc renderInventory*(player: Character, renderer: RendererPtr) =
    let transform = ZERO
    let bgTexture = TextureAlias.inventoryBackground
    let bgDimens = bgTexture.getDimens
    var srect = newSdlRect(0, 0, bgDimens.x, bgDimens.y)
    var drect = srect
    drawImage(bgTexture, srect, drect, renderer, transform)
    renderCharacterFullPreview(player, mainPreviewRect, renderer, transform)
    for r in previewRects:
        renderCharacterCroppedPreview(player, r, renderer, transform)


proc trySwapItem(character: var Character, backpackSlot: Vec2) =
    let item = character.backpack[backpackSlot]
    #TODO check if item is clothing, etc
    let itemSlot = item.slot 
    let current = character.clothes[itemSlot]
    character.clothes[itemSlot] = item
    character.backpack[backpackSlot] = current


proc loopInventory*(game: Game) =
    if game.keyPressed(Input.tab):
        game.screen = Screen.world

    
    if game.keyPressed(Input.enter):
        trySwapItem(game.gameState.playerCharacter, v(0,0))        
    
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

const ITEM_ICON_SIZE = TILE_SIZE div 4

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

proc getItemSlotPosition(player, x, y: int): Rect =
    let newX = 60 + x * 9
    let newY = 62 + y * 9
    newSdlSquare(newX, newY, ITEM_ICON_SIZE)

proc renderItemPreview(item: Clothing, pos: Vec2,
                       renderer: RendererPtr, transform: Vec2) =
    var srcRect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
    var destRect = newSdlSquare(pos.x, pos.y, ITEM_ICON_SIZE)
    drawImage(item.icon, srcRect, destRect, renderer, transform)

const mainPreviewRect = v(18, 8)
const previewRects = [
    v(61, 11),
]

const clothingPositions = [
    v(3, 8),
    v(4, 17),
    v(4, 26)
]

proc renderCursor(cursor: InventoryCursor,
                  renderer: RendererPtr, transform: Vec2) =
    var drect = 
        if not cursor.left:
            getItemSlotPosition(cursor.player, cursor.x, cursor.y)
        else:
            newSdlSquare(clothingPositions[cursor.i].x,
                         clothingPositions[cursor.i].y,
                         ITEM_ICON_SIZE)
    var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
    drawImage(TextureAlias.inventoryCursor, srect, drect, renderer, transform)

proc renderInventory*(game: Game) =
    let renderer = game.renderer
    let player = game.gameState.playerCharacter
    let transform = ZERO
    let bgTexture = TextureAlias.inventoryBackground
    let bgDimens = bgTexture.getDimens
    var srect = newSdlRect(0, 0, bgDimens.x, bgDimens.y)
    var drect = srect
    drawImage(bgTexture, srect, drect, renderer, transform)

    renderCursor(game.invCursor, renderer, transform)

    renderCharacterFullPreview(player, mainPreviewRect, renderer, transform)
    for r in previewRects:
        renderCharacterCroppedPreview(player, r, renderer, transform)
    
    for item in player.clothes:
        renderItemPreview(item, clothingPositions[ord(item.slot)],
                          renderer, transform)

    for slot in player.backpack.indices:
        let item = player.backpack[slot]
        if not item.isNone:
            var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
            var drect = getItemSlotPosition(0, slot.x, slot.y)
            drawImage(item.icon, srect, drect, renderer, transform)


proc trySwapItem(character: var Character, cursor: InventoryCursor) =
    let item = character.backpack[cursor.x, cursor.y]
    if not cursor.left:
        if not item.isNone:
            #TODO check if item is clothing, etc
            let itemSlot = item.slot 
            let current = character.clothes[itemSlot]
            character.clothes[itemSlot] = item
            character.backpack[cursor.x, cursor.y] = current
    else:
        var firstOpenSlot: Vec2 = v(-1, -1)
        for slot in character.backpack.indices:
            if character.backpack[slot].isNone:
                firstOpenSlot = slot
                break
        
        if firstOpenSlot != v(-1, -1):
            #TODO there has to be a cleaner way to do this
            #how to get enum item by index?
            let itemSlot =
                case cursor.i
                of 0: ClothingSlot.head
                of 1: ClothingSlot.body
                else: ClothingSlot.feet
            let current = character.clothes[itemSlot]
            let item = character.backpack[firstOpenSlot]
            character.backpack[firstOpenSlot] = current
            character.clothes[itemSlot] = item



proc loopInventory*(game: Game) =
    if game.keyPressed(Input.tab):
        game.screen = Screen.world

    let moveX =
        if game.keyPressed(Input.right): 1
        elif game.keyPressed(Input.left): -1
        else: 0

    let moveY =
        if game.keyPressed(Input.up): -1
        elif game.keyPressed(Input.down): 1
        else: 0

    let backpack = game.gameState.playerCharacter.backpack

    if not game.invCursor.left:
        if game.invCursor.x + moveX < 0:
            game.invCursor.left = true
        else:
            game.invCursor.x = (game.invCursor.x + moveX) mod backpack.width
    else:
        if moveX > 0:
            game.invCursor.left = false
    
    if game.invCursor.left:
        game.invCursor.i = (game.invCursor.i + moveY) mod clothingPositions.len
    else:
        game.invCursor.y = (game.invCursor.y + moveY) mod backpack.height

    
    if game.keyPressed(Input.enter):
        trySwapItem(game.gameState.playerCharacter, game.invCursor)        
    
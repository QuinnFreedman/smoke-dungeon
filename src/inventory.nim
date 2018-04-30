import sdl2
import macros
import
    matrix,
    vector,
    utils,
    constants,
    character,
    render_utils,
    textures,
    item,
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
    let newX = 60 + x * 9 + player * 41
    let newY = 62 + y * 9
    newSdlSquare(newX, newY, ITEM_ICON_SIZE)

proc renderItemPreview(item: Item, pos: Vec2,
                       renderer: RendererPtr, transform: Vec2) =
    var srcRect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
    var destRect = newSdlSquare(pos.x, pos.y, ITEM_ICON_SIZE)
    drawImage(item.icon, srcRect, destRect, renderer, transform)

const mainPreviewRect = v(18, 8)
const previewRects = [
    v(61, 11),
    v(102, 11),
    v(140, 11),
    v(160, 11),
]

const clothingPositions = [
    v(3, 8),
    v(4, 17),
    v(4, 26)
]

proc renderCursor(inv: Inventory,
                  renderer: RendererPtr, transform: Vec2) =
    if inv.cursorInTopRow:
        let weirdOffset = v(3, -1) #TODO temporary offset for current inv screen
        drawImage(TextureAlias.inventoryCursorBig,
                  previewRects[inv.curBackpack] + weirdOffset,
                  renderer, transform)
    else:
        var drect =
            if not inv.cursorInSidePane:
                getItemSlotPosition(inv.curBackpack, inv.curX, inv.curY)
            else:
                newSdlSquare(clothingPositions[inv.curI].x,
                            clothingPositions[inv.curI].y,
                            ITEM_ICON_SIZE)
        var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
        drawImage(TextureAlias.inventoryCursor, srect, drect, renderer, transform)

proc renderInventory*(game: Game) =
    let renderer = game.renderer
    let transform = ZERO
    let bgTexture = TextureAlias.inventoryBackground
    let bgDimens = bgTexture.getDimens
    var srect = newSdlRect(0, 0, bgDimens.x, bgDimens.y)
    var drect = srect
    drawImage(bgTexture, srect, drect, renderer, transform)

    renderCursor(game.inventory, renderer, transform)

    let activeCharacter = game.gamestate.playerParty[game.inventory.activeCharacter]
    if not activeCharacter.isNil:
        renderCharacterFullPreview(activeCharacter[], mainPreviewRect, renderer, transform)

        for item in activeCharacter.clothes:
            assert item.kind == ItemType.clothing
            renderItemPreview(item,
                    clothingPositions[ord(item.clothingInfo.slot)],
                    renderer, transform)

    for i, character in game.gameState.playerParty:
        if character.isNil: continue

        character[].renderCharacterCroppedPreview(
            previewRects[i], renderer, transform)

        for slot in character.backpack.indices:
            let item = character.backpack[slot]
            if not item.isNone:
                var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
                var drect = getItemSlotPosition(i, slot.x, slot.y)
                drawImage(item.icon, srect, drect, renderer, transform)


proc trySwapItem(playerParty: seq[ref Character], inv: Inventory) =
    template activeChar: untyped = playerParty[inv.activeCharacter]
    if not inv.cursorInSidePane:
        template bag: untyped = playerParty[inv.curBackpack].backpack
        let item = bag[inv.curX, inv.curY]
        if not item.isNone:
            case item.kind
            of ItemType.clothing:
                let itemSlot = item.clothingInfo.slot
                let current = activeChar.clothes[itemSlot]
                activeChar.clothes[itemSlot] = item
                bag[inv.curX, inv.curY] = current
            of ItemType.weapon:
                discard #TODO allow equipping weapons
    else:
        var firstOpenSlot: Vec2 = v(-1, -1)
        for slot in activeChar.backpack.indices:
            if activeChar.backpack[slot].isNone:
                firstOpenSlot = slot
                break

        if firstOpenSlot != v(-1, -1):
            if inv.curI < 3:
                #TODO there has to be a cleaner way to do this
                #how to get enum item by index?
                let itemSlot =
                    case inv.curI
                    of 0: ClothingSlot.head
                    of 1: ClothingSlot.body
                    else: ClothingSlot.feet
                let current = activeChar.clothes[itemSlot]
                activeChar.backpack[firstOpenSlot] = current
                activeChar.clothes[itemSlot] = NONE_ITEM
            else:
                discard #TODO allow equipping weapons

proc getCurrentBackpack(inv: Inventory, playerParty: seq[ref Character]): Matrix[Item] =
    playerParty[inv.curBackpack].backpack

proc updateInvCursor(inv: var Inventory,
                     playerParty: seq[ref Character],
                     moveX, moveY: int, enter: bool) =
    if inv.cursorInSidePane:
        if moveX > 0: inv.cursorInSidePane = false
        inv.curI = (inv.curI + moveY) mod clothingPositions.len
    elif inv.cursorInTopRow:
        if moveY > 0:
            inv.curX = 0
            inv.cursorInTopRow = false
        else:
            let nextBackpack = inv.curBackpack + moveX
            if nextBackpack >= 0 and
                    nextBackpack < playerParty.len and
                    not playerParty[nextBackpack].isNil:
                inv.curBackpack = nextBackpack
    else:
        let newX = inv.curX + moveX
        if inv.curBackpack == 0 and newX < 0:
            inv.cursorInSidePane = true
        elif newX < 0:
            inv.curBackpack -= 1
            inv.curX = getCurrentBackpack(inv, playerParty).width - 1
        elif newX > getCurrentBackpack(inv, playerParty).width - 1:
            if not playerParty[inv.curBackpack + 1].isNil:
                inv.curBackpack += 1
                inv.curX = 0
        else:
            inv.curX = newX

        let newY = inv.curY + moveY

        if newY < 0:
            inv.cursorInTopRow = true
        else:
            inv.curY = min(newY,
                           getCurrentBackpack(inv, playerParty).height - 1)

    if enter:
        if inv.cursorInTopRow:
            inv.activeCharacter = inv.curBackpack
        else:
            trySwapItem(playerParty, inv)

proc updateMenu(inv: Inventory, moveX, moveY: int, enter: bool) =
    discard


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

    let enter = game.keyPressed(Input.enter)

    if moveX == 0 and moveY == 0 and not enter: return

    template inv: untyped = game.inventory
    if inv.inMenu:
        updateMenu(inv, moveX, moveY, enter)
    else:
        updateInvCursor(inv, game.gamestate.playerParty, moveX, moveY, enter)

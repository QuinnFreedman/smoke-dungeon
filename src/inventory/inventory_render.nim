import sdl2

import
    ../character_utils,
    ../constants,
    ../item_utils,
    ../matrix,
    ../render_character,
    ../render_utils,
    ../textures,
    ../types,
    ../utils,
    ../vector,
    inventory_utils


const ITEM_ICON_SIZE = TILE_SIZE div 4


proc renderCharacterCroppedPreview(character: Character, pos: Vec2,
                                   renderer: RendererPtr, transform: Vec2) =
    let h = TILE_SIZE - 6
    var srcRect = newSdlRect(0, 0, TILE_SIZE, h)
    var destRect = newSdlRect(pos.x, pos.y, TILE_SIZE, h)

    drawImage(character.spritesheet, srcRect, destRect, renderer, transform)
    for item in character.iterWornItems:
        drawImage(item.getTexture(character.sex), srcRect, destRect,
                  renderer, transform)

func getItemSlotPosition(player, x, y: int): Rect =
    let newX = 60 + x * 9 + player * 41
    let newY = 62 + y * 9
    newSdlSquare(newX, newY, ITEM_ICON_SIZE)

proc renderItemPreview(item: Item, pos: Vec2,
                       renderer: RendererPtr, transform: Vec2) =
    var srcRect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
    var destRect = newSdlSquare(pos.x, pos.y, ITEM_ICON_SIZE)
    drawImage(item.icon, srcRect, destRect, renderer, transform)

const mainPreviewRect = v(18, 8)
const previewRects: array[MAX_PARTY_SIZE, Vec2] = [
    v(61, 11),
    v(102, 11),
    v(140, 11),
    v(160, 11),
]

const equippedItemPreviewRects: array[NUM_EQUIPPED_SLOTS, Vec2] = [
    v(3, 8),
    v(4, 17),
    v(4, 26),
    v(4, 35),
    v(3, 44)
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
                newSdlSquare(equippedItemPreviewRects[inv.curI].x,
                            equippedItemPreviewRects[inv.curI].y,
                            ITEM_ICON_SIZE)
        var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
        drawImage(TextureAlias.inventoryCursor, srect, drect, renderer, transform)


func renderMenu(inv: Inventory, activeChar: Character,
                renderer: RenderInfo, transform: Vec2) =

    let menuItems = getMenuItems(inv.menuSubject,
                                 inv.cursorInSidePane,
                                 activeChar)

    let upperLeft = v(10, 60) + transform

    for i, option in menuItems:
        let pos = upperLeft + v(0, 10 * i)
        if i == inv.menuCursor:
            renderer.renderText("*", pos + v(-8, 0), color(0,0,0,255))
        renderer.renderText($option, pos, color(0,0,0,255))

func renderInventory*(inventory: var Inventory,
                      playerParty: seq[Character],
                      renderInfo: RenderInfo) =
    renderInfo.renderText("Inventory screen doesn't work anymore",
            v(50, 50), WHITE)
    # let renderer = renderInfo.renderer
    # let transform = ZERO
    #
    # let bgTexture = TextureAlias.inventoryBackground
    # let bgDimens = bgTexture.getDimens
    # var srect = newSdlRect(0, 0, bgDimens.x, bgDimens.y)
    # var drect = srect
    # drawImage(bgTexture, srect, drect, renderer, transform)
    #
    # let activeCharacter = playerParty[inventory.activeCharacter]
    #
    # if inventory.inMenu:
    #     renderMenu(inventory, activeCharacter,
    #                renderInfo, transform)
    # else:
    #     renderCursor(inventory, renderer, transform)
    #
    # if not activeCharacter.isNil:
    #     renderStaticCharacter(activeCharacter, mainPreviewRect,
    #                           renderer, transform)
    #
    #     for item in activeCharacter.iterWornItems:
    #         assert item.kind == ItemType.clothing
    #         if item.kind == ItemType.clothing:
    #             renderItemPreview(item,
    #                     equippedItemPreviewRects[ord(item.clothingInfo.slot)],
    #                     renderer, transform)
    #
    #     if activeCharacter.kind == CharacterType.humanoid:
    #         renderItemPreview(activeCharacter.rightHand,
    #                 equippedItemPreviewRects[3],
    #                 renderer, transform)
    #         renderItemPreview(activeCharacter.leftHand,
    #                 equippedItemPreviewRects[4],
    #                 renderer, transform)
    #
    # for i, character in playerParty:
    #     if character.isNil: continue
    #
    #     character.renderCharacterCroppedPreview(
    #         previewRects[i], renderer, transform)
    #
    #     for slot in character.backpack.indices:
    #         let item = character.backpack[slot]
    #         if not item.isNone:
    #             var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
    #             var drect = getItemSlotPosition(i, slot.x, slot.y)
    #             drawImage(item.icon, srect, drect, renderer, transform)

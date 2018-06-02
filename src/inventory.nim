import sdl2
import macros
import
    types,
    matrix,
    vector,
    keyboard,
    utils,
    constants,
    character_utils,
    render_utils,
    textures,
    item_utils,
    game_utils,
    render_character


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

const equippedItemPreviewRects = [
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

type MenuAction {.pure.} = enum
    equip = "Equip"
    unequip = "Unequip"
    equipRight = "Equip right"
    equipLeft = "Equip left"
    inspect = "Inspect"
    quit = "Nevermind"

const MENU_GENERIC_ITEM = @[
        MenuAction.equip, MenuAction.inspect, MenuAction.quit
]

const MENU_EQUIPPED_ITEM = @[
        MenuAction.unequip,
        MenuAction.inspect, MenuAction.quit
]

const MENU_HANDED_WEAPON = @[
        MenuAction.equipLeft, MenuAction.equipRight,
        MenuAction.inspect, MenuAction.quit
]

const MENU_NO_EQUIP = @[
        MenuAction.inspect, MenuAction.quit
]

proc getMenuItems(subject: Item, itemIsEquipped: bool, activeChar: Character):
        seq[MenuAction] =
    if activeChar.kind == CharacterType.animal:
        MENU_NO_EQUIP
    else:
        let isHandedWeapon = subject.kind == ItemType.weapon and
            subject.weaponInfo.handedness == Handed.single

        if itemIsEquipped:
            MENU_EQUIPPED_ITEM
        elif isHandedWeapon:
            MENU_HANDED_WEAPON
        else:
            MENU_GENERIC_ITEM


proc renderMenu(inv: Inventory, activeChar: Character,
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

proc renderInventory*(inventory: var Inventory,
                      playerParty: seq[Character],
                      renderInfo: RenderInfo) =
    let renderer = renderInfo.renderer
    let transform = ZERO

    let bgTexture = TextureAlias.inventoryBackground
    let bgDimens = bgTexture.getDimens
    var srect = newSdlRect(0, 0, bgDimens.x, bgDimens.y)
    var drect = srect
    drawImage(bgTexture, srect, drect, renderer, transform)

    let activeCharacter = playerParty[inventory.activeCharacter]

    if inventory.inMenu:
        renderMenu(inventory, activeCharacter,
                   renderInfo, transform)
    else:
        renderCursor(inventory, renderer, transform)

    if not activeCharacter.isNil:
        renderStaticCharacter(activeCharacter, mainPreviewRect,
                              renderer, transform)

        for item in activeCharacter.iterWornItems:
            assert item.kind == ItemType.clothing
            if item.kind == ItemType.clothing:
                renderItemPreview(item,
                        equippedItemPreviewRects[ord(item.clothingInfo.slot)],
                        renderer, transform)

        if activeCharacter.kind == CharacterType.humanoid:
            renderItemPreview(activeCharacter.rightHand,
                    equippedItemPreviewRects[3],
                    renderer, transform)
            renderItemPreview(activeCharacter.leftHand,
                    equippedItemPreviewRects[4],
                    renderer, transform)

    for i, character in playerParty:
        if character.isNil: continue

        character.renderCharacterCroppedPreview(
            previewRects[i], renderer, transform)

        for slot in character.backpack.indices:
            let item = character.backpack[slot]
            if not item.isNone:
                var srect = newSdlSquare(0, 0, ITEM_ICON_SIZE)
                var drect = getItemSlotPosition(i, slot.x, slot.y)
                drawImage(item.icon, srect, drect, renderer, transform)



proc getItemAtCursor(inv: Inventory, playerParty: seq[Character]): Item =
    alias activeChar: playerParty[inv.activeCharacter]

    if inv.cursorInTopRow:
         NONE_ITEM
    elif inv.cursorInSidePane:
        case activeChar.kind
        of CharacterType.humanoid:
            case inv.curI
            of 0: activeChar.clothes[ClothingSlot.head]
            of 1: activeChar.clothes[ClothingSlot.body]
            of 2: activeChar.clothes[ClothingSlot.feet]
            of 3: activeChar.rightHand
            of 4: activeChar.leftHand
            else: raise IndexError.newException("item slot index out of bounds")
        of animal:
            NONE_ITEM
    else:
        playerParty[inv.curBackpack].backpack[inv.curX, inv.curY]


proc setItemAtCursor(inv: Inventory, playerParty: seq[Character], item: Item) =
    alias activeChar: playerParty[inv.activeCharacter]

    if inv.cursorInTopRow:
         discard
    elif inv.cursorInSidePane:
        case activeChar.kind
        of CharacterType.humanoid:
            case inv.curI
            of 0: activeChar.clothes[ClothingSlot.head] = item
            of 1: activeChar.clothes[ClothingSlot.body] = item
            of 2: activeChar.clothes[ClothingSlot.feet] = item
            of 3: activeChar.rightHand = item
            of 4: activeChar.leftHand = item
            else: raise IndexError.newException("item slot index out of bounds")
        of CharacterType.animal:
            discard
    else:
        playerParty[inv.curBackpack].backpack[inv.curX, inv.curY] = item


proc getCurrentBackpack(inv: Inventory, playerParty: seq[Character]): Matrix[Item] =
    playerParty[inv.curBackpack].backpack

proc updateInvCursor(inv: var Inventory,
                     playerParty: seq[Character],
                     moveX, moveY: int, enter: bool) =
    if inv.cursorInSidePane:
        if moveX > 0: inv.cursorInSidePane = false
        inv.curI = (inv.curI + moveY) mod equippedItemPreviewRects.len
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
            inv.menuSubject = inv.getItemAtCursor(playerParty)
            if not inv.menuSubject.isNone:
                inv.menuCursor = 0
                inv.inMenu = true


proc updateMenu(inv: var Inventory, playerParty: seq[Character],
                moveX, moveY: int, enter: bool) =
    # the character that is SELECTED/previewed
    alias activeChar: playerParty[inv.activeCharacter]

    let menuItems = getMenuItems(inv.menuSubject,
                                 inv.cursorInSidePane, activeChar)
    inv.menuCursor = (inv.menuCursor + moveY) mod menuItems.len

    if enter:
        inv.inMenu = false

        # first two available slots in SELECTED PLAYER's backpack
        var firstOpenSlots = [v(-1, -1), v(-1, -1)]
        var numOpenSlots = 0
        for slot in activeChar.backpack.indices:
            if activeChar.backpack[slot].isNone:
                firstOpenSlots[numOpenSlots] = slot
                numOpenSlots += 1
                if numOpenSlots == 2: break

        # the bag where the CURSOR is
        let item = inv.menuSubject
        let menuAction = menuItems[inv.menuCursor]
        case menuAction
        of MenuAction.equip:
            case item.kind:
            of ItemType.weapon:
                if numOpenSlots >= 2:
                    activeChar.backpack[firstOpenSlots[0]] = activeChar.rightHand
                    activeChar.backpack[firstOpenSlots[1]] = activeChar.leftHand
                    activeChar.rightHand = item
                    activeChar.leftHand = NONE_ITEM
            of ItemType.clothing:
                let clothingSlot = item.clothingInfo.slot
                let currentlyEquipped = activeChar.clothes[clothingSlot]
                activeChar.clothes[clothingSlot] = item
                inv.setItemAtCursor(playerParty, currentlyEquipped)
        of MenuAction.unequip:
            if numOpenSlots >= 1:
                activeChar.backpack[firstOpenSlots[0]] = item
                inv.setItemAtCursor(playerParty, NONE_ITEM)
        of MenuAction.equipRight:
            let currentlyEquipped = activeChar.rightHand
            activeChar.rightHand = item
            inv.setItemAtCursor(playerParty, currentlyEquipped)
        of MenuAction.equipLeft:
            let currentlyEquipped = activeChar.leftHand
            activeChar.leftHand = item
            inv.setItemAtCursor(playerParty, currentlyEquipped)
        of MenuAction.quit:
            discard
        of MenuAction.inspect:
            discard #TODO allow inspect


proc loopInventory*(inv: var Inventory, playerParty: seq[Character],
                    keyboard: Keyboard): ScreenChange =
    if keyboard.keyPressed(Input.tab):
        result = ScreenChange(changeTo: Screen.world)

    let moveX =
        if keyboard.keyPressed(Input.right): 1
        elif keyboard.keyPressed(Input.left): -1
        else: 0

    let moveY =
        if keyboard.keyPressed(Input.up): -1
        elif keyboard.keyPressed(Input.down): 1
        else: 0

    let enter = keyboard.keyPressed(Input.enter)

    if moveX == 0 and moveY == 0 and not enter: return

    if inv.inMenu:
        updateMenu(inv, playerParty, moveX, moveY, enter)
    else:
        updateInvCursor(inv, playerParty, moveX, moveY, enter)

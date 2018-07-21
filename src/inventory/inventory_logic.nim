import sdl2

import
    ../character_utils,
    ../game_utils,
    ../item_utils,
    ../keyboard,
    ../matrix,
    ../types,
    ../utils,
    ../vector,
    inventory_utils


# proc getItemAtCursor(inv: Inventory, playerParty: seq[Character]): Item =
#     alias activeChar: playerParty[inv.activeCharacter]
#
#     if inv.cursorInTopRow:
#          NONE_ITEM
#     elif inv.cursorInSidePane:
#         case activeChar.kind
#         of CharacterType.humanoid:
#             case inv.curI
#             of 0: activeChar.clothes[ClothingSlot.head]
#             of 1: activeChar.clothes[ClothingSlot.body]
#             of 2: activeChar.clothes[ClothingSlot.feet]
#             of 3: activeChar.rightHand
#             of 4: activeChar.leftHand
#             else: raise IndexError.newException("item slot index out of bounds")
#         of animal:
#             NONE_ITEM
#     else:
#         playerParty[inv.curBackpack].backpack[inv.curX, inv.curY]


# proc setItemAtCursor(inv: Inventory, playerParty: seq[Character], item: Item) =
#     alias activeChar: playerParty[inv.activeCharacter]
#
#     if inv.cursorInTopRow:
#          discard
#     elif inv.cursorInSidePane:
#         case activeChar.kind
#         of CharacterType.humanoid:
#             case inv.curI
#             of 0: activeChar.clothes[ClothingSlot.head] = item
#             of 1: activeChar.clothes[ClothingSlot.body] = item
#             of 2: activeChar.clothes[ClothingSlot.feet] = item
#             of 3: activeChar.rightHand = item
#             of 4: activeChar.leftHand = item
#             else: raise IndexError.newException("item slot index out of bounds")
#         of CharacterType.animal:
#             discard
#     else:
#         playerParty[inv.curBackpack].backpack[inv.curX, inv.curY] = item


# proc getCurrentBackpack(inv: Inventory, playerParty: seq[Character]): Matrix[Item] =
#     playerParty[inv.curBackpack].backpack

# proc updateInvCursor(inv: var Inventory,
#                      playerParty: seq[Character],
#                      moveX, moveY: int, enter: bool) =
#     if inv.cursorInSidePane:
#         if moveX > 0: inv.cursorInSidePane = false
#         inv.curI = (inv.curI + moveY) mod NUM_EQUIPPED_SLOTS
#     elif inv.cursorInTopRow:
#         if moveY > 0:
#             inv.curX = 0
#             inv.cursorInTopRow = false
#         else:
#             let nextBackpack = inv.curBackpack + moveX
#             if nextBackpack >= 0 and
#                     nextBackpack < playerParty.len and
#                     not playerParty[nextBackpack].isNil:
#                 inv.curBackpack = nextBackpack
#     else:
#         let newX = inv.curX + moveX
#         if inv.curBackpack == 0 and newX < 0:
#             inv.cursorInSidePane = true
#         elif newX < 0:
#             inv.curBackpack -= 1
#             inv.curX = getCurrentBackpack(inv, playerParty).width - 1
#         elif newX > getCurrentBackpack(inv, playerParty).width - 1:
#             if not playerParty[inv.curBackpack + 1].isNil:
#                 inv.curBackpack += 1
#                 inv.curX = 0
#         else:
#             inv.curX = newX
#
#         let newY = inv.curY + moveY
#
#         if newY < 0:
#             inv.cursorInTopRow = true
#         else:
#             inv.curY = min(newY,
#                            getCurrentBackpack(inv, playerParty).height - 1)
#
#     if enter:
#         if inv.cursorInTopRow:
#             inv.activeCharacter = inv.curBackpack
#         else:
#             inv.menuSubject = inv.getItemAtCursor(playerParty)
#             if not inv.menuSubject.isNone:
#                 inv.menuCursor = 0
#                 inv.inMenu = true


# proc updateMenu(inv: var Inventory, playerParty: seq[Character],
#                 moveX, moveY: int, enter: bool) =
#     # the character that is SELECTED/previewed
#     alias activeChar: playerParty[inv.activeCharacter]
#
#     let menuItems = getMenuItems(inv.menuSubject,
#                                  inv.cursorInSidePane, activeChar)
#     inv.menuCursor = (inv.menuCursor + moveY) mod menuItems.len
#
#     if enter:
#         inv.inMenu = false
#
#         # first two available slots in SELECTED PLAYER's backpack
#         var firstOpenSlots = [v(-1, -1), v(-1, -1)]
#         var numOpenSlots = 0
#         for slot in activeChar.backpack.indices:
#             if activeChar.backpack[slot].isNone:
#                 firstOpenSlots[numOpenSlots] = slot
#                 numOpenSlots += 1
#                 if numOpenSlots == 2: break
#
#         # the bag where the CURSOR is
#         let item = inv.menuSubject
#         let menuAction = menuItems[inv.menuCursor]
#         case menuAction
#         of MenuAction.equip:
#             case item.kind:
#             of ItemType.weapon:
#                 if numOpenSlots >= 2:
#                     activeChar.backpack[firstOpenSlots[0]] = activeChar.rightHand
#                     activeChar.backpack[firstOpenSlots[1]] = activeChar.leftHand
#                     activeChar.rightHand = item
#                     activeChar.leftHand = NONE_ITEM
#             of ItemType.clothing:
#                 let clothingSlot = item.clothingInfo.slot
#                 let currentlyEquipped = activeChar.clothes[clothingSlot]
#                 activeChar.clothes[clothingSlot] = item
#                 inv.setItemAtCursor(playerParty, currentlyEquipped)
#         of MenuAction.unequip:
#             if numOpenSlots >= 1:
#                 activeChar.backpack[firstOpenSlots[0]] = item
#                 inv.setItemAtCursor(playerParty, NONE_ITEM)
#         of MenuAction.equipRight:
#             let currentlyEquipped = activeChar.rightHand
#             activeChar.rightHand = item
#             inv.setItemAtCursor(playerParty, currentlyEquipped)
#         of MenuAction.equipLeft:
#             let currentlyEquipped = activeChar.leftHand
#             activeChar.leftHand = item
#             inv.setItemAtCursor(playerParty, currentlyEquipped)
#         of MenuAction.quit:
#             discard
#         of MenuAction.inspect:
#             discard #TODO allow inspect


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

    # if inv.inMenu:
    #     updateMenu(inv, playerParty, moveX, moveY, enter)
    # else:
    #     updateInvCursor(inv, playerParty, moveX, moveY, enter)

import
    ../types

const NUM_EQUIPPED_SLOTS* = 5

type MenuAction* {.pure.} = enum
    equip = "Equip"
    unequip = "Unequip"
    equipRight = "Equip right"
    equipLeft = "Equip left"
    inspect = "Inspect"
    quit = "Nevermind"


const MENU_GENERIC_ITEM* = @[
        MenuAction.equip, MenuAction.inspect, MenuAction.quit
]

const MENU_EQUIPPED_ITEM* = @[
        MenuAction.unequip,
        MenuAction.inspect, MenuAction.quit
]

const MENU_HANDED_WEAPON* = @[
        MenuAction.equipLeft, MenuAction.equipRight,
        MenuAction.inspect, MenuAction.quit
]

const MENU_NO_EQUIP* = @[
        MenuAction.inspect, MenuAction.quit
]

func getMenuItems*(subject: Weapon, itemIsEquipped: bool, activeChar: Character):
        seq[MenuAction] =
    if activeChar.kind == CharacterType.animal:
        MENU_NO_EQUIP
    else:
        if itemIsEquipped:
            MENU_EQUIPPED_ITEM
        elif subject.weaponInfo.handedness == Handed.single:
            MENU_HANDED_WEAPON
        else:
            MENU_GENERIC_ITEM

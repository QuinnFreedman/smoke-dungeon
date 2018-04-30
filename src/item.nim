import
    textures,
    simple_types


type
    ItemType* {.pure.} = enum clothing, weapon

    Item* = object
        name*: string
        icon*: TextureAlias
        case kind*: ItemType
        of ItemType.clothing: clothingInfo*: ClothingInfo
        of ItemType.weapon: weaponInfo*: WeaponInfo

    WeaponInfo* = object
        baseDamage*: int
        critChance*: float
        critBonus*: float
        weaponRange*: AttackRange
        handedness*: Handed

    AttackRange* {.pure.} = enum melee, short, long, ally

    Handed* {.pure.} = enum single, double

    ClothingInfo* = object
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        slot*: ClothingSlot

    ClothingSlot* {.pure.} = enum
        head, body, feet


let NONE_ITEM*: Item = Item( name: nil )


proc getTexture*(self: Item, sex: Sex): TextureAlias =
    case self.kind:
        of ItemType.clothing:
            if sex == Sex.male: self.clothingInfo.textureMale
            else: self.clothingInfo.textureFemale
        of ItemType.weapon:
            TextureAlias.none

proc isNone*(self: Item): bool =
    self.name.isNil

import
    textures,
    simple_types

type ClothingSlot* {.pure.} = enum
    head, body, feet

type
    Clothing* = object
        name*: string
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        icon*: TextureAlias
        slot*: ClothingSlot

proc getTexture*(self: Clothing, sex: Sex): TextureAlias =
    if sex == Sex.male: self.textureMale
    else: self.textureFemale

proc isNone*(self: Clothing): bool =
    self.name.isNil

const MAGE_HOOD* = Clothing(
    name: "Mage Hood",
    textureMale: TextureAlias.mageHoodMale,
    textureFemale: TextureAlias.mageHoodFemale,
    icon: TextureAlias.mageHeadIcon,
    slot: ClothingSlot.head
)

const MAGE_CLOAK* = Clothing(
    name: "Mage Cloak",
    textureMale: TextureAlias.mageCloakMale,
    textureFemale: TextureAlias.mageCloakFemale,
    icon: TextureAlias.mageChestIcon,
    slot: ClothingSlot.body
)

const MAGE_SHOES* = Clothing(
    name: "Mage SHOES",
    textureMale: TextureAlias.mageFeetMale,
    textureFemale: TextureAlias.mageFeetFemale,
    icon: TextureAlias.mageFeetIcon,
    slot: ClothingSlot.feet
)

const KNIGHT_HELMET* = Clothing(
    name: "Knight Helmet",
    textureMale: TextureAlias.knightHelmetMale,
    textureFemale: TextureAlias.knightHelmetFemale,
    icon: TextureAlias.knightHeadIcon,
    slot: ClothingSlot.head
)

const KNIGHT_CHESTPLATE* = Clothing(
    name: "Knight Chestplate",
    textureMale: TextureAlias.knightChestMale,
    textureFemale: TextureAlias.knightChestFemale,
    icon: TextureAlias.knightChestIcon,
    slot: ClothingSlot.body
)

const KNIGHT_GRIEVES* = Clothing(
    name: "Knight Grieves",
    textureMale: TextureAlias.knightFeetMale,
    textureFemale: TextureAlias.knightFeetFemale,
    icon: TextureAlias.knightFeetIcon,
    slot: ClothingSlot.feet
)
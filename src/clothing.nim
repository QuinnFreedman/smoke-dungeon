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
    icon: mageHeadIcon,
    slot: ClothingSlot.head
)
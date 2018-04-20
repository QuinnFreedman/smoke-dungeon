import textures

type ClothingSlot* {.pure.} = enum
    head, body, feet

type
    Clothing* = object
        name*: string
        textureMale*: TextureAlias
        textureFemale*: TextureAlias
        slot: ClothingSlot


const MAGE_HOOD* = Clothing(
    name: "Mage Hood",
    textureMale: TextureAlias.mageHoodMale,
    textureFemale: TextureAlias.mageHoodFemale,
    slot: ClothingSlot.head
)
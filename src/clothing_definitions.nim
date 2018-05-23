import
    types,
    textures


let MAGE_HOOD* = Item(
    kind: ItemType.clothing,
    name: "Mage Hood",
    icon: TextureAlias.mageHeadIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageHoodMale,
        textureFemale: TextureAlias.mageHoodFemale,
        slot: ClothingSlot.head
    )
)

let MAGE_CLOAK* = Item(
    kind: ItemType.clothing,
    name: "Mage Cloak",
    icon: TextureAlias.mageChestIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageCloakMale,
        textureFemale: TextureAlias.mageCloakFemale,
        slot: ClothingSlot.body
    )
)

let MAGE_SHOES* = Item(
    kind: ItemType.clothing,
    name: "Mage Shoes",
    icon: TextureAlias.mageFeetIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageFeetMale,
        textureFemale: TextureAlias.mageFeetFemale,
        slot: ClothingSlot.feet
    )
)

let KNIGHT_HELMET* = Item(
    kind: ItemType.clothing,
    name: "Knight Helmet",
    icon: TextureAlias.knightHeadIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightHelmetMale,
        textureFemale: TextureAlias.knightHelmetFemale,
        slot: ClothingSlot.head
    )
)

let KNIGHT_CHESTPLATE* = Item(
    kind: ItemType.clothing,
    name: "Knight Chestplate",
    icon: TextureAlias.knightChestIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightChestMale,
        textureFemale: TextureAlias.knightChestFemale,
        slot: ClothingSlot.body
    )
)

let KNIGHT_GRIEVES* = Item(
    kind: ItemType.clothing,
    name: "Knight Grieves",
    icon: TextureAlias.knightFeetIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightFeetMale,
        textureFemale: TextureAlias.knightFeetFemale,
        slot: ClothingSlot.feet
    )
)

import
    types,
    textures


let MAGE_HOOD* = Clothing(
    # name: "Mage Hood",
    icon: TextureAlias.mageHeadIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageHoodMale,
        textureFemale: TextureAlias.mageHoodFemale,
        slot: ClothingSlot.head
    )
)

let MAGE_CLOAK* = Clothing(
    # name: "Mage Cloak",
    icon: TextureAlias.mageChestIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageCloakMale,
        textureFemale: TextureAlias.mageCloakFemale,
        slot: ClothingSlot.body
    )
)

let MAGE_SHOES* = Clothing(
    # name: "Mage Shoes",
    icon: TextureAlias.mageFeetIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.mageFeetMale,
        textureFemale: TextureAlias.mageFeetFemale,
        slot: ClothingSlot.feet
    )
)

let KNIGHT_HELMET* = Clothing(
    # name: "Knight Helmet",
    icon: TextureAlias.knightHeadIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightHelmetMale,
        textureFemale: TextureAlias.knightHelmetFemale,
        slot: ClothingSlot.head
    )
)

let KNIGHT_CHESTPLATE* = Clothing(
    # name: "Knight Chestplate",
    icon: TextureAlias.knightChestIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightChestMale,
        textureFemale: TextureAlias.knightChestFemale,
        slot: ClothingSlot.body
    )
)

let KNIGHT_GRIEVES* = Clothing(
    # name: "Knight Grieves",
    icon: TextureAlias.knightFeetIcon,
    clothingInfo: ClothingInfo(
        textureMale: TextureAlias.knightFeetMale,
        textureFemale: TextureAlias.knightFeetFemale,
        slot: ClothingSlot.feet
    )
)

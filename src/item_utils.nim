import
    types,
    textures


let NONE_ITEM*: Item = Item( name: nil )

proc isNone*(self: Item): bool =
    self.name.isNil


proc getTexture*(self: Item, sex: Sex): TextureAlias =
    case self.kind:
        of ItemType.clothing:
            if sex == Sex.male: self.clothingInfo.textureMale
            else: self.clothingInfo.textureFemale
        of ItemType.weapon:
            TextureAlias.none

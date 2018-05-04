import
    sdl2,
    sdl2.image,
    tables

import
    utils,
    constants,
    vector

type FileNotFoundError = object of Exception

var TEXTURE_LOADER_CACHE = initTable[string, TexturePtr]()


proc cachedLoadTexture(renderer: RendererPtr, path: string): TexturePtr =
    result = TEXTURE_LOADER_CACHE.getOrDefault(path)
    if result.isNil:
        result = renderer.loadTexture(path)
        if result.isNil:
            raise FileNotFoundError.newException("File not found: " & path)
        TEXTURE_LOADER_CACHE[path] = result


const IMAGES = "assets/images/"
const SPRITESHEETS = IMAGES & "spritesheets/"
const BASE_ARMOR_MAGE = SPRITESHEETS & "armor_mage/"
const BASE_ARMOR_KNIGHT = SPRITESHEETS & "armor_knight/"

type TextureAlias* {.pure.} = enum
    none
    mapTiles = IMAGES & "texturesheet.png"
    inventoryBackground = IMAGES & "inventory.png"
    inventoryCursor = IMAGES & "inventory_cursor.png"
    inventoryCursorBig = IMAGES & "inventory_cursor_big.png"
    # Spider
    spider = SPRITESHEETS & "spider.png"
    # Human
    humanFemaleBase = SPRITESHEETS & "base_human_female.png"
    humanMaleBase = SPRITESHEETS & "base_human_male.png"

    # Mage
    mageHoodMale = BASE_ARMOR_MAGE & "mage_head_male.png"
    mageHoodFemale = BASE_ARMOR_MAGE & "mage_head_female.png"
    mageCloakMale = BASE_ARMOR_MAGE & "mage_chest_male.png"
    mageCloakFemale = BASE_ARMOR_MAGE & "mage_chest_female.png"
    mageFeetMale = BASE_ARMOR_MAGE & "mage_feet_male.png"
    mageFeetFemale = BASE_ARMOR_MAGE & "mage_feet_female.png"

    mageChestIcon = BASE_ARMOR_MAGE & "mage_chest_icon.png"
    mageHeadIcon = BASE_ARMOR_MAGE & "mage_head_icon.png"
    mageFeetIcon = BASE_ARMOR_MAGE & "mage_feet_icon.png"

    # Knight
    knightHelmetMale = BASE_ARMOR_KNIGHT & "knight_head_male.png"
    knightHelmetFemale = BASE_ARMOR_KNIGHT & "knight_head_female.png"
    knightChestMale = BASE_ARMOR_KNIGHT & "knight_chest_male.png"
    knightChestFemale = BASE_ARMOR_KNIGHT & "knight_chest_female.png"
    knightFeetMale = BASE_ARMOR_KNIGHT & "knight_feet_male.png"
    knightFeetFemale = BASE_ARMOR_KNIGHT & "knight_feet_female.png"

    knightChestIcon = BASE_ARMOR_KNIGHT & "knight_chest_icon.png"
    knightHeadIcon = BASE_ARMOR_KNIGHT & "knight_head_icon.png"
    knightFeetIcon = BASE_ARMOR_KNIGHT & "knight_feet_icon.png"

    # Items
    basicSwordIcon = IMAGES & "sword_icon.png"



proc tile(x, y: int): sdl2.Rect =
    newSdlSquare(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE)


const DIRT1* = tile(0, 0)
const DIRT2* = tile(1, 0)
const DIRT3* = tile(2, 0)
const DIRT4* = tile(3, 0)
const DIRT5* = tile(4, 0)
const DIRT6* = tile(5, 0)
const GRASS_SHORT1* = tile(0, 1)
const GRASS_SHORT2* = tile(1, 1)
const GRASS_MED*    = tile(2, 1)
const SAND*         = tile(3, 1)
const GRASS_LONG1*  = tile(5, 1)
const GRASS_LONG2*  = tile(6, 1)
const GRASS_LONG3*  = tile(7, 1)

const STONE1* = tile(0, 2)

const BLACK* = tile(7, 0)



var texturStore: array[TextureAlias, TexturePtr]

proc initTextures*(renderer: RendererPtr) =
    for t in TextureAlias:
        if t != TextureAlias.none:
            texturStore[t] = renderer.cachedLoadTexture($t)

proc getTexture*(texture: TextureAlias): TexturePtr {.inline.} =
    texturStore[texture]

proc getDimens*(texture: TextureAlias): Vec2 =
    var w, h: cint
    var wPtr = addr w
    var hPtr = addr h
    texture.getTexture.queryTexture(nil, nil, wPtr, hPtr)
    v(w, h)

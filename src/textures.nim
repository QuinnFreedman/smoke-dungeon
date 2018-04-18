import
    sdl2, 
    sdl2.image,
    tables

import
    utils,
    constants

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

type TextureAlias* {.pure.} = enum
    mapTiles = IMAGES & "texturesheet.png"
    humanFemaleBase = SPRITESHEETS & "base_human_female.png"
    humanMaleBase = SPRITESHEETS & "base_human_male.png"


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



var texturStore: array[TextureAlias, TexturePtr]

proc initTextures*(renderer: RendererPtr) =
    for t in TextureAlias:
        texturStore[t] = renderer.cachedLoadTexture($t)

proc getTexture*(texture: TextureAlias): TexturePtr {.inline.} =
    texturStore[texture]
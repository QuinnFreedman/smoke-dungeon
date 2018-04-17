import
    sdl2, 
    sdl2.image,
    os

import 
    constants,
    utils,
    character

type FileNotFoundError = object of Exception

proc safeLoadTexture(renderer: RendererPtr, path: string): TexturePtr =
    result = renderer.loadTexture(path)
    if result.isNil:
        raise FileNotFoundError.newException("File not found: " & path)

type GameResources* = object
    mapTexture*: TexturePtr
    mapTiles*: array[32, Rect]
    baseSpriteFemaleHuman: TexturePtr
    baseSpriteMaleHuman: TexturePtr

proc getBaseSpriteSheet*(self: GameResources,
                         race: Race, sex: Sex): TexturePtr =
    case race
    of human:
        case sex
        of male:
            self.baseSpriteMaleHuman
        of female:
            self.baseSpriteFemaleHuman

const SPRITESHEETS = "assets/images/spritesheets/"
proc initResources*(r: RendererPtr): GameResources =
    result.mapTexture = r.safeLoadTexture("assets/images/texturesheet.png")
    let mapTextureWidth = 8
    let mapTextureHeight = 4
    for i in 0..mapTextureWidth * mapTextureHeight - 1:
        let y = i div mapTextureWidth
        let x = i mod mapTextureWidth
        result.mapTiles[i] = newSdlSquare(x * TILE_SIZE, y * TILE_SIZE,
                                          TILE_SIZE)
    result.baseSpriteFemaleHuman = r.safeLoadTexture(
        SPRITESHEETS & "female_spritesheet.png")
    result.baseSpriteMaleHuman = r.safeLoadTexture(
        SPRITESHEETS & "male_spritesheet.png")


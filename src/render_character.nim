import sdl2

import
    types,
    vector,
    textures,
    constants,
    character_utils,
    render_utils


func getClothingTexture*(self: Clothing, sex: Sex): TextureAlias =
    if sex == Sex.male: self.clothingInfo.textureMale
    else: self.clothingInfo.textureFemale

# proc renderStaticCharacter*(character: Character, pos: Vec2,
#                             renderer: RendererPtr, transform: Vec2) =
#     let srcRect = character.getStaticSrcRect

#     drawTile(character.spritesheet, srcRect, pos, renderer, transform)

#     for item in character.iterWornItems:
#         drawTile(item.getClothingTexture(character.sex), srcRect, pos,
#                  renderer, transform)

proc renderStaticCharacter*(character: Character, pos: Vec2, scale: int,
                            renderer: RendererPtr) =
    var drect = rect(cint(pos.x), cint(pos.y),
                     cint(TILE_SIZE * scale),
                     cint(TILE_SIZE * scale))
    var srect = character.getStaticSrcRect
    drawImage(character.spritesheet,
                srect, drect, renderer, v(0, 0))
    for item in character.iterWornItems:
        let sprite = item.getClothingTexture(character.sex)
        drawImage(sprite, srect, drect, renderer, v(0, 0))


proc renderCharacter*(character: Character,
                      renderer: RendererPtr, transfrom: Vec2) =
    var drect = character.getDestRect
    if character.health > 0:
        var srect = character.getSrcRect
        drawImage(character.spritesheet,
                  srect, drect, renderer, transfrom)
        for item in character.iterWornItems:
            let sprite = item.getClothingTexture(character.sex)
            drawImage(sprite, srect, drect, renderer, transfrom)
    else:
        var srect = rect(0, 0, TILE_SIZE, TILE_SIZE)
        drawImage(TextureAlias.bloodStain, srect, drect,
                  renderer, transfrom)

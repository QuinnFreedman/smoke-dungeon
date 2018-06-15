import sdl2

import
    types,
    vector,
    textures,
    constants,
    character_utils,
    item_utils,
    render_utils

proc renderStaticCharacter*(character: Character, pos: Vec2,
                            renderer: RendererPtr, transform: Vec2) =
    let srcRect = character.getStaticSrcRect

    drawTile(character.spritesheet, srcRect, pos, renderer, transform)

    for item in character.iterWornItems:
        drawTile(item.getTexture(character.sex), srcRect, pos,
                 renderer, transform)


proc renderCharacter*(character: Character,
                      renderer: RendererPtr, transfrom: Vec2) =
    var drect = character.getDestRect
    if character.health > 0:
        var srect = character.getSrcRect
        drawImage(character.spritesheet,
                  srect, drect, renderer, transfrom)
        for item in character.iterWornItems:
            let sprite = item.getTexture(character.sex)
            drawImage(sprite, srect, drect, renderer, transfrom)
    else:
        var srect = rect(0, 0, TILE_SIZE, TILE_SIZE)
        drawImage(TextureAlias.bloodStain, srect, drect,
                  renderer, transfrom)

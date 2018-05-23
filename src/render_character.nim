import sdl2

import
    types,
    character,
    vector,
    item,
    render_utils

proc renderStaticCharacter*(character: Character, pos: Vec2,
                            renderer: RendererPtr, transform: Vec2) =
    let srcRect = character.getStaticSrcRect

    drawTile(character.spritesheet, srcRect, pos, renderer, transform)

    for item in character.iterWornItems:
        drawTile(item.getTexture(character.sex), srcRect, pos,
                 renderer, transform)

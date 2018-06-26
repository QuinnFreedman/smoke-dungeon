import sdl2

import
    constants,
    matrix,
    render_utils,
    textures,
    types,
    utils,
    vector


proc renderMap*(map: Level, window: Rect,
                renderer: RendererPtr, transform: Vec2, fow=true) =
    alias textures: map.textures
    for pos in window.iterRect:
        if textures.contains(pos) and (map.seen[pos] or not fow):
            let srect = textures[pos]
            let tilePos = pos.scale(TILE_SIZE)
            drawTile(TextureAlias.mapTiles,
                     srect, tilePos, renderer, transform)

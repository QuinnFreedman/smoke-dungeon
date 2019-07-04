import sdl2

import
    constants,
    matrix,
    render_utils,
    textures,
    types,
    utils,
    vector

func debugTintTile*(tile: Vec2, color: Color, renderer: RendererPtr, transform: Vec2) =
    renderer.setDrawBlendMode(BlendMode_Blend)
    let tilePos = tile.scale(TILE_SIZE)
    let myRect = rect(tilePos.x.cint, tilePos.y.cint, TILE_SIZE, TILE_SIZE)
    fillRect(myRect, color, renderer, transform)


proc renderMap*(map: Level, window: Rect,
                renderer: RendererPtr, transform: Vec2, fow=true) =
    alias textures: map.textures
    for pos in window.iterRect:
        if textures.contains(pos) and (map.seen[pos] or not fow):
            let srect = textures[pos]
            let tilePos = pos.scale(TILE_SIZE)
            drawTile(TextureAlias.mapTiles,
                     srect, tilePos, renderer, transform)
            
            if map.decals[pos] != TextureAlias.none:
                # drawTile(TextureAlias.mapTiles,
                #         newSdlSquare(7 * TILE_SIZE, 0 * TILE_SIZE, TILE_SIZE),
                #          tilePos, renderer, transform)
                drawImage(map.decals[pos], pos.scale(TILE_SIZE),
                        renderer, transform)

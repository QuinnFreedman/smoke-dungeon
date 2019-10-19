# import sdl2

import
    # ../constants,
    # ../matrix,
    # ../render_character,
    ../render_utils,
    # ../textures,
    ../types,
    # ../utils,
    ../vector
    # inventory_utils


# const ITEM_ICON_SIZE = TILE_SIZE div 4



func renderInventory*(inventory: var Inventory,
                      playerParty: seq[Character],
                      renderInfo: RenderInfo) =
    renderInfo.renderText("Inventory screen doesn't work anymore",
            v(50, 50), WHITE)

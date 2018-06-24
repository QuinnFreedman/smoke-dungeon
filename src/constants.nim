const
    TILE_SIZE* = 32

    SCREEN_WIDTH_TILES* = 16
    SCREEN_HEIGHT_TILES* = 9

    # set to -1 for infinite line of sight
    FOV_RADIUS* = 4
    FOG_OF_WAR* = true

    MAX_PARTY_SIZE* = 4

    # computed
    SCREEN_WIDTH_PIXELS* = SCREEN_WIDTH_TILES * TILE_SIZE
    SCREEN_HEIGHT_PIXELS* = SCREEN_HEIGHT_TILES * TILE_SIZE

const
    TILE_SIZE* = 32

    # Width and height of the screen (in tiles).
    # The screen is centered on a single tile so an even number means
    # edge tiles will be cut in half
    SCREEN_WIDTH_TILES* = 16
    SCREEN_HEIGHT_TILES* = 9

    # Width of combat screen in terms of tiles around a center tile
    # e.g. total width = 2 * COMBAT_SCREEN_RADIUS_X + 1
    COMBAT_SCREEN_RADIUS_X* = 3
    COMBAT_SCREEN_RADIUS_Y* = 2

    # set to -1 for infinite line of sight
    FOV_RADIUS* = 4
    FOG_OF_WAR* = true

    MAX_PARTY_SIZE* = 4

    # using decimal numbers for turn costs could cause rounding errors,
    # so instead each character gets a whole number of points each turn
    # to spend on abilities
    ABILITY_POINTS_PER_TURN* = 2


    # How long the transition animation takes to slide the screen
    TRANSITION_LENGTH_SECONDS* = 3.0


    # computed
    SCREEN_WIDTH_PIXELS* = SCREEN_WIDTH_TILES * TILE_SIZE
    SCREEN_HEIGHT_PIXELS* = SCREEN_HEIGHT_TILES * TILE_SIZE

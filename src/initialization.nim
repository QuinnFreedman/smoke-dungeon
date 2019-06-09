import
    sdl2,
    sdl2/ttf,
    random,
    times,
    strutils,
    sequtils

import
    types,
    vector,
    keyboard,
    matrix,
    dungeon_generation,
    clothing_definitions,
    weapon_definitions,
    render_utils,
    character_utils,
    class_definitions,
    race_definitions,
    ai,
    main_menu/main_menu_init

proc initGameData*(window: WindowPtr, renderer: RendererPtr, font: FontPtr): Game =
    new result
    result.window = window
    result.renderInfo = RenderInfo(
        renderer: renderer,
        font: font,
        # textCache: newTextCache()
    )

    result.mainMenu = initMenu(result.prefs)

    result.screen = Screen.world

    let seed = 1535223949 #int64(epochTime())
    # let seed = int64(1524099821)
    # let seed = 1527012709

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerParty = newSeq[Character]()

    var playerCharacter = newCharacter(result.gameState.level,
        v(0, levelHeight div 2), 2,
        kind=CharacterType.humanoid,
        race=RACE_HUMAN,
        sex=Sex.male,
        class=CLASS_WIZARD)

    playerCharacter.clothes[ClothingSlot.head] = MAGE_HOOD
    playerCharacter.clothes[ClothingSlot.body] = KNIGHT_CHESTPLATE
    playerCharacter.clothes[ClothingSlot.feet] = KNIGHT_GRIEVES
    # playerCharacter.backpack[0, 0] = KNIGHT_HELMET
    # playerCharacter.backpack[1, 0] = MAGE_CLOAK
    # playerCharacter.backpack[3, 1] = MAGE_SHOES
    # playerCharacter.backpack[2, 1] = KNOCKBACK_SWORD
    playerCharacter.weapon = KNOCKBACK_SWORD
    result.gameState.playerParty.add(playerCharacter)

    var companion1 = newCharacter(result.gameState.level,
        v(1, levelHeight div 2), 2,
        kind=CharacterType.humanoid,
        race=RACE_HUMAN,
        sex=Sex.male,
        class=CLASS_ROGUE)
    # companion1.backpack[1, 0] = KNIGHT_HELMET
    companion1.weapon = BLEED_KNIFE
    companion1.ai.worldMovement = AI_FOLLOW
    companion1.following = playerCharacter
    result.gameState.playerParty.add(companion1)

    var spider = newCharacter(result.gameState.level,
        v(2, levelHeight div 2 - 1), 2,
        kind=CharacterType.animal,
        race=RACE_SPIDER,
        sex=Sex.male,
        class=CLASS_ROGUE)
    spider.weapon = NONE_WEAPON

    result.gameState.entities = concat(result.gameState.playerParty)
    result.gameState.entities.add(spider)

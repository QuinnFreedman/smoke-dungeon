import
    sdl2,
    sdl2.ttf,
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
    utils,
    render_utils,
    character,
    class_definitions


proc width*(self: Level): int {.inline.} =
    self.walls.width

proc height*(self: Level): int {.inline.} =
    self.walls.height

proc renderer*(self: Game): RendererPtr {.inline.} =
    self.renderInfo.renderer


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    self.keyboard.handleInput(input, keyDown)


proc keyDown*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyDown(key)


proc keyPressed*(self: Game, key: Input): bool {.inline.} =
    self.keyboard.keyPressed(key)


proc resetInputs*(self: Game) =
    self.keyboard.resetInputs()


proc initGameData*(renderer: RendererPtr, font: FontPtr): Game =
    new result
    result.renderInfo = RenderInfo(
        renderer: renderer,
        font: font,
        textCache: newTextCache()
    )

    # let seed = int64(epochTime())
    # let seed = int64(1524099821)
    # let seed = 1527012709
    let seed = 1527012836

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerParty = newSeq[Character]()

    var playerCharacter = newCharacter(result.gameState.level,
        v(levelWidth div 2, levelHeight div 2), 2,
        Race.human, Sex.male, ROGUE)

    playerCharacter.clothes[ClothingSlot. head] = MAGE_HOOD
    playerCharacter.clothes[ClothingSlot.body] = KNIGHT_CHESTPLATE
    playerCharacter.clothes[ClothingSlot.feet] = KNIGHT_GRIEVES
    playerCharacter.backpack[0, 0] = KNIGHT_HELMET
    playerCharacter.backpack[1, 0] = MAGE_CLOAK
    playerCharacter.backpack[3, 1] = MAGE_SHOES
    playerCharacter.backpack[2, 1] = IRON_SHORTSWORD
    result.gameState.playerParty.add(playerCharacter)

    var companion1 = newCharacter(result.gameState.level,
        v(levelWidth div 2 + 1, levelHeight div 2), 2,
        Race.human, Sex.male, ROGUE)
    companion1.backpack[1, 0] = KNIGHT_HELMET
    # companion1.ai = AI.follow
    companion1.following = playerCharacter
    result.gameState.playerParty.add(companion1)

    var spider = newCharacter(result.gameState.level,
        v(levelWidth div 2, levelHeight div 2 - 1), 2,
        Race.spider, Sex.male, ROGUE)
    # spider.ai = AI.random
    spider.kind = CharacterType.animal

    result.gameState.entities = concat(result.gameState.playerParty)
    result.gameState.entities.add(spider)

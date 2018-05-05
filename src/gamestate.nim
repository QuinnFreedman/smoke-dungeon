import
    sdl2,
    sdl2.ttf,
    random,
    times,
    strutils,
    sequtils

import
    matrix,
    character,
    direction,
    vector,
    textures,
    dungeon_generation,
    item,
    clothing_definitions,
    weapon_definitions,
    utils,
    simple_types,
    level,
    render_utils

type
    Input* {.pure.} = enum none, left, right, up, down, tab, enter

    Screen* {.pure.} = enum world, inventory

    Inventory* = object
        curBackpack*: int
        curX*, curY*, curI*: int
        cursorInSidePane*, cursorInTopRow*: bool
        activeCharacter*: int
        inMenu*: bool
        menuCursor*: int
        menuSubject*: Item

    Game* = ref object
        shouldQuit*: bool
        inputs*: array[Input, bool]
        inputsSinceLastFrame: array[Input, bool]
        renderer*: RendererPtr
        font*: FontPtr
        textCache*: TextCache
        screen*: Screen
        inventory*: Inventory
        gameState*: GameState

    GameState* = object
        level*: Level
        playerParty*: seq[Character]
        entities*: seq[Character]

    TextRenderer* = object
        renderer*: RendererPtr
        font*: FontPtr
        textCache*: TextCache


proc getTextRenderer*(self: Game): TextRenderer {.inline.} =
    result.renderer = self.renderer
    result.font = self.font
    result.textCache = self.textCache


proc renderText*(self: TextRenderer, text: string,
                 pos: Vec2, color: Color) {.inline.} =
    renderText(self.renderer, self.font, text,
               pos.x.cint, pos.y.cint, color, self.textCache)


proc handleInput*(self: var Game, input: Input, keyDown: bool) {.inline.} =
    if keyDown and not self.inputs[input]:
        self.inputsSinceLastFrame[input] = true
    self.inputs[input] = keyDown


proc keyDown*(self: Game, key: Input): bool {.inline.} =
    self.inputs[key]


proc keyPressed*(self: Game, key: Input): bool {.inline.} =
    self.inputsSinceLastFrame[key]


proc resetInputs*(self: Game) =
    self.inputsSinceLastFrame.zero()


proc initGameData*(renderer: RendererPtr, font: FontPtr): Game =
    new result
    result.renderer = renderer
    result.font = font
    result.textCache = newTextCache()

    let seed = int64(epochTime())
    # let seed = int64(1524099821)

    var rng: Rand = initRand(seed)
    echo "Creating map with seed: $1".format(seed)
    let levelWidth = 100
    let levelHeight = 100
    result.gameState.level = generateLevel(levelWidth, levelHeight, rng)

    result.gameState.playerParty = newSeq[Character]()

    var playerCharacter = newCharacter(
        v(levelWidth div 2, levelHeight div 2), 2, Race.human, Sex.male)

    playerCharacter.clothes[ClothingSlot. head] = MAGE_HOOD
    playerCharacter.clothes[ClothingSlot.body] = KNIGHT_CHESTPLATE
    playerCharacter.clothes[ClothingSlot.feet] = KNIGHT_GRIEVES
    playerCharacter.backpack[0, 0] = KNIGHT_HELMET
    playerCharacter.backpack[1, 0] = MAGE_CLOAK
    playerCharacter.backpack[3, 1] = MAGE_SHOES
    playerCharacter.backpack[2, 1] = IRON_SHORTSWORD
    result.gameState.playerParty.add(playerCharacter)

    var companion1 = newCharacter(
        v(levelWidth div 2 + 1, levelHeight div 2), 2, Race.human, Sex.male)
    companion1.backpack[1, 0] = KNIGHT_HELMET
    companion1.ai = AI.follow
    companion1.following = playerCharacter
    result.gameState.playerParty.add(companion1)

    var spider = newCharacter(
        v(levelWidth div 2, levelHeight div 2 - 1), 2, Race.spider, Sex.male)
    spider.ai = AI.random

    result.gameState.entities = concat(result.gameState.playerParty)
    result.gameState.entities.add(spider)

import
    math,
    sdl2

import
    vector,
    direction,
    constants,
    utils,
    textures,
    item,
    matrix,
    simple_types,
    astar,
    level,
    times,
    random


type
    AI* {.pure.} = enum none, follow, random

    CharacterType* {.pure.} = enum humanoid, animal

    Character* = ref object
        currentTile*: Vec2
        nextTile*: Vec2
        actualPos*: Vec2f
        facing*: Direction
        speed*: float
        race*: Race
        sex*: Sex
        backpack*: Matrix[Item]
        spritesheet*: TextureAlias

        case kind*: CharacterType
        of humanoid:
            clothes*: array[ClothingSlot, Item]
            leftHand*: Item
            rightHand*: Item
        of animal: discard

        case ai*: AI
        of AI.follow: following*: Character
        else: discard


proc getBaseSpriteSheet(race: Race, sex: Sex): TextureAlias =
    case race
    of human:
        case sex
        of male:
            TextureAlias.humanMaleBase
        of female:
            TextureAlias.humanFemaleBase
    of spider:
        TextureAlias.spider


proc newCharacter*(pos: Vec2, speed: float, race: Race, sex: Sex):
        Character =
    new result
    result.currentTile = pos
    result.nextTile = pos
    result.actualPos = vecFloat(pos)
    result.facing = Direction.down
    result.speed = speed
    result.race = race
    result.sex = sex
    result.backpack = newMatrix[Item](4, 2)
    result.spritesheet = getBaseSpriteSheet(race, sex)


proc isMoving(self: Character): bool {.inline.} =
    self.currentTile != self.nextTile


proc move*(self: Character, dir: Direction, collision: Matrix[bool]) =
    if self.currentTile != self.nextTile:
        return

    self.facing = dir

    let dest: Vec2 = self.currentTile + directionVector(dir)

    if collision.contains(dest):
        if not collision[dest]:
            self.nextTile = dest

# TODO move to util or vector/direction
proc directionTo(f, t: Vec2): Direction =
    let delta = t - f
    if abs(delta.x) > abs(delta.y):
        if delta.x < 0: Direction.left
        else: Direction.right
    else:
        if delta.y < 0: Direction.up
        else: Direction.down


proc update*(self: Character, level: Level, dt: float) =
    if self.isMoving:
        let dif = vecFloat(self.nextTile) - self.actualPos

        let moveAmount = self.speed * dt

        if abs(dif.x) < moveAmount:
            self.actualPos.x = float(self.nextTile.x)
        else:
            self.actualPos.x += float(sgn(dif.x)) * moveAmount

        if abs(dif.y) < moveAmount:
            self.actualPos.y = float(self.nextTile.y)
        else:
            self.actualPos.y += float(sgn(dif.y)) * moveAmount

        if abs(dif.x) < moveAmount and abs(dif.y) < moveAmount:
            self.currentTile = self.nextTile
    else:
        case self.ai
        of AI.follow:
            if not self.following.isNil:
                let path = aStarSearch(level.walls, self.currentTile,
                                       self.following.nextTile, 3)
                if path.len > 3:
                    self.nextTile = path[path.len - 2]
                    self.facing = self.currentTile.directionTo(self.nextTile)
        of AI.random:
            if rand(100) < 1:
                self.move(randomDirection(), level.walls)
        else: discard




proc animationTimer*(self: Character): float {.inline.} =
    let distanceToMove = vecFloat(self.nextTile - self.currentTile)
    let distanceMoved = self.actualPos - vecFloat(self.currentTile)

    if distanceToMove.x != 0:
        abs(distanceMoved.x / distanceToMove.x)
    elif distanceToMove.y != 0:
        abs(distanceMoved.y / distanceToMove.y)
    else:
        0


proc getStaticSrcRect*(self: Character): sdl2.Rect =
    newSdlSquare(0, 0, TILE_SIZE)


proc getSrcRect*(self: Character): sdl2.Rect =
    let row =
        case self.facing
        of down: 0
        of right: 1
        of left: 2
        of up: 3

    let frame =
        if not self.isMoving:
            0
        else:
            int(self.animationTimer * 7.0) mod 7

    newSdlSquare(frame * TILE_SIZE, row * TILE_SIZE, TILE_SIZE)


proc getDestRect*(self: Character): sdl2.Rect =
    newSdlSquare(int(round(self.actualPos.x * TILE_SIZE)),
                 int(round(self.actualPos.y * TILE_SIZE)),
                 TILE_SIZE)

proc getWornItem*(self: Character, slot: ClothingSlot): (bool, Item) =
    case self.kind
    of CharacterType.humanoid:
        let item = self.clothes[slot]
        result[0] = item.name != nil
        result[1] = item
    of CharacterType.animal:
        discard


iterator iterWornItems*(self: Character): Item =
    for slot in ClothingSlot.items:
        let (exists, item) = self.getWornItem(slot)
        if exists:
            yield item

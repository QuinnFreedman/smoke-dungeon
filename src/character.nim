import
    math,
    sdl2

import
    vector,
    direction,
    constants,
    utils,
    textures,
    clothing,
    matrix,
    simple_types


type Character* = object
    currentTile*: Vec2
    nextTile*: Vec2
    actualPos*: Vec2f
    facing*: Direction
    speed*: float
    race*: Race
    sex*: Sex
    clothes*: array[ClothingSlot, Clothing]
    backpack*: Matrix[Clothing] #TODO make Item type
    spritesheet*: TextureAlias


proc getBaseSpriteSheet(race: Race, sex: Sex): TextureAlias =
    case race
    of human:
        case sex
        of male:
            TextureAlias.humanMaleBase
        of female:
            TextureAlias.humanFemaleBase


proc newCharacter*(pos: Vec2, speed: float, race: Race, sex: Sex): Character =
    result.currentTile = pos
    result.nextTile = pos
    result.actualPos = vecFloat(pos)
    result.facing = Direction.down
    result.speed = speed
    result.race = race
    result.sex = sex
    result.backpack = newMatrix[Clothing](4, 2)
    result.spritesheet = getBaseSpriteSheet(race, sex)
    

proc move*(self: var Character, dir: Direction, collision: Matrix[bool]) =
    if self.currentTile != self.nextTile:
        return

    self.facing = dir
        
    let dest: Vec2 = self.currentTile + directionVector(dir)
    
    if collision.contains(dest):
        if not collision[dest]:
            self.nextTile = dest



proc update*(self: var Character, dt: float) =
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
    

proc isMoving(self: Character): bool {.inline.} =
    self.currentTile != self.nextTile


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

proc getWornItem*(self: Character, slot: ClothingSlot): (bool, Clothing) =
    let item = self.clothes[slot]
    result[0] = item.name != nil
    result[1] = item

#TODO does this alloc?
iterator iterWornItems*(self: Character): Clothing =
    for slot in ClothingSlot.items:
        let (exists, item) = self.getWornItem(slot)
        if exists:
            yield item
            
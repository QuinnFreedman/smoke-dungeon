import
    math,
    sdl2

import
    vector,
    direction,
    constants,
    utils,
    textures,
    clothingtypes,
    matrix

type Race* = enum human

type Sex* = enum male, female

type ItemSet* = object
    head: ClothingHead
    body: ClothingBody
    legs: ClothingFeet

type Character* = object
    currentTile*: Vec2
    nextTile*: Vec2
    actualPos*: Vec2f
    facing*: Direction
    speed*: float
    race*: Race
    sex*: Sex
    items*: ItemSet
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
    result.spritesheet = getBaseSpriteSheet(race, sex)
    

proc move*(self: var Character, dir: Direction, collision: Matrix[bool]) =
    if self.currentTile != self.nextTile:
        return


    self.facing = dir
        
    let dest: Vec2 =
        case dir
        of up:
            self.currentTile + UP
        of down:
            self.currentTile + DOWN
        of left:
            self.currentTile + LEFT
        of right:
            self.currentTile + RIGHT
    
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


proc animationTimer(self: Character): float {.inline.} =
    let distanceToMove = vecFloat(self.nextTile - self.currentTile)
    let distanceMoved = vecFloat(self.nextTile) - self.actualPos

    if distanceToMove.x != 0:
        distanceMoved.x / distanceToMove.x
    elif distanceToMove.y != 0:
        distanceMoved.y / distanceToMove.y
    else:
        0

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
            let tilesPerSecond = self.speed
            let secondsPerTile = 1.0 / tilesPerSecond
            int(self.animationTimer / secondsPerTile * 7.0) mod 7

    newSdlSquare(frame * TILE_SIZE, row * TILE_SIZE, TILE_SIZE)
 

proc getDestRect*(self: Character): sdl2.Rect =
    newSdlSquare(int(round(self.actualPos.x * TILE_SIZE)),
                 int(round(self.actualPos.y * TILE_SIZE)),
                 TILE_SIZE)
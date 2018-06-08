import
    math,
    sdl2,
    random

import
    types,
    vector,
    direction,
    constants,
    utils,
    textures,
    item_utils,
    matrix,
    astar,
    times

# -------------------------------------
# Combat stats
# -------------------------------------

proc get*(self: Character, stat: Stat): int =
    result = self.class.stats[stat] + self.statMods[stat]
    #TODO loop through items
    for aura in self.auras:
        if not aura.getStat.isNil:
            result += aura.getStat(stat, result)

proc getWeapons*(self: Character): (int, array[2, Item]) =
    if self.kind == CharacterType.humanoid:
        if self.leftHand.isNone and self.rightHand.isNone:
            (1, [NONE_WEAPON, NONE_ITEM])
        elif self.leftHand.isNone:
            (2, [self.rightHand, NONE_WEAPON])
        elif self.rightHand.isNone:
            (2, [NONE_WEAPON, self.leftHand])
        else:
            (2, [self.leftHand, self.rightHand])
    else:
        (1, [NONE_WEAPON, NONE_ITEM])


iterator iterWeapons*(self: Character): Item =
    let (numWeapons, weapons) = self.getWeapons()
    for i in 0..<numWeapons:
        yield weapons[i]

iterator iterAbilities*(self: Character): Ability =
    for ability in self.unlockedAbilities:
        yield ability
    yield Ability( name: "Rest" )
    # yield BASIC_ATTACK
    # if self.class.isMagicUser:
    #     yield HEAVY_ATTACK
    # else:
    #     yield ZAP
    #     yield BURN
    # yield NONE_ABILITY

proc numAbilites*(self: Character): int =
    for _ in self.iterAbilities:
        result += 1

proc getAbility*(self: Character, index: int): Ability =
    var i = 0
    for ability in self.iterAbilities:
        if i == index: return ability
        i += 1


# -------------------------------------
# Utils
# -------------------------------------

proc isMoving*(self: Character): bool {.inline.} =
    self.currentTile != self.nextTile


proc teleport*(self: Character, pos: Vec2, facing: Direction,
               collision: var Matrix[uint8]) =
    collision.dec(self.nextTile)
    collision.inc(pos)
    self.currentTile = pos
    self.nextTile = pos
    self.actualPos = pos.vecFloat
    self.facing = facing


proc move*(self: Character, dir: Direction, collision: var Matrix[uint8]) =
    if self.currentTile != self.nextTile:
        return

    self.facing = dir

    let dest: Vec2 = self.currentTile + directionVector(dir)

    if collision.contains(dest):
        if collision[dest] == 0:
            self.nextTile = dest
            collision.dec(self.currentTile)
            collision.inc(self.nextTile)


proc moveToward*(self: Character, dest: Vec2, collision: var Matrix[uint8]) =
    self.move(self.currentTile.directionTo(dest), collision)


proc faceToward*(self: Character, target: Vec2) =
    self.facing = self.currentTile.directionTo(target)


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

proc `$` *(self: Character): string =
    if self.isNil: "nil"
    else: $self.sex & " " & self.race.name & " " & self.class.name


# -------------------------------------
# Update
# -------------------------------------

proc update*(self: Character, level: var Level, dt: float) =
    if self.health <= 0: return

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

proc loopAI*(self: Character, others: seq[Character], level: var Level) {.inline.} =
    if not self.ai.worldMovement.isNil:
        self.ai.worldMovement(self, others, level)



# -------------------------------------
# Rendering
# -------------------------------------

proc getBaseSpriteSheet(race: Race, sex: Sex): TextureAlias =
    case sex
    of male:
        race.baseSpritesheetMale
    of female:
        race.baseSpritesheetFemale

proc getStaticSrcRect*(self: Character): sdl2.Rect =
    newSdlSquare(0, 0, TILE_SIZE)


proc animationTimer*(self: Character): float {.inline.} =
    let distanceToMove = vecFloat(self.nextTile - self.currentTile)
    let distanceMoved = self.actualPos - vecFloat(self.currentTile)

    if distanceToMove.x != 0:
        abs(distanceMoved.x / distanceToMove.x)
    elif distanceToMove.y != 0:
        abs(distanceMoved.y / distanceToMove.y)
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
            int(self.animationTimer * 7.0) mod 7

    newSdlSquare(frame * TILE_SIZE, row * TILE_SIZE, TILE_SIZE)


proc getDestRect*(self: Character): sdl2.Rect =
    newSdlSquare(int(round(self.actualPos.x * TILE_SIZE)),
                 int(round(self.actualPos.y * TILE_SIZE)),
                 TILE_SIZE)


# -------------------------------------
# Initialization
# -------------------------------------

proc newCharacter*(level: var Level,
                   pos: Vec2, speed: float, race: Race, sex: Sex,
                   class: Class): Character =
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
    result.class = class
    result.auras = newSeq[Aura]()
    result.ai = race.defaultAi
    result.unlockedAbilities = newSeq[Ability]()
    result.health = class.stats[Stat.maxHp]
    for ab in class.startingAbilities:
        result.unlockedAbilities.add(ab)
    level.collision.inc(pos)

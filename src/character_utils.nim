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
# Utils
# -------------------------------------

func `$` *(self: Character): string =
    if self.isNil: "nil"
    else: $self.sex & " " & self.race.name & " " & self.class.name

func isMoving*(self: Character): bool {.inline.} =
    self.currentTile != self.nextTile


func teleport*(self: Character, pos: Vec2, facing: Direction,
               level: var Level) =
    level.dynamicEntities[self.nextTile] = nil
    level.dynamicEntities[pos] = self
    self.currentTile = pos
    self.nextTile = pos
    self.actualPos = pos.vecFloat
    self.facing = facing


proc move*(self: Character, dir: Direction, level: var Level) =
    if self.currentTile != self.nextTile:
        return

    self.facing = dir

    let dest: Vec2 = self.currentTile + directionVector(dir)

    if not level.collision(dest):
        self.nextTile = dest
        level.dynamicEntities[self.currentTile] = nil
        level.dynamicEntities[self.nextTile] = self

func swap*(a, b: Character, level: var Level) =
    a.nextTile = b.currentTile
    a.facing = a.currentTile.directionTo(b.currentTile)

    b.nextTile = a.currentTile
    b.facing = b.currentTile.directionTo(a.currentTile)

    level.dynamicEntities[a.nextTile] = a
    level.dynamicEntities[b.nextTile] = b

proc moveToward*(self: Character, dest: Vec2, level: var Level) =
    self.move(self.currentTile.directionTo(dest), level)


func faceToward*(self: Character, target: Vec2) =
    self.facing = self.currentTile.directionTo(target)


func getWornItem*(self: Character, slot: ClothingSlot): (bool, Item) =
    case self.kind
    of CharacterType.humanoid:
        let item = self.clothes[slot]
        result[0] = item.name != ""
        result[1] = item
    of CharacterType.animal:
        discard


iterator iterWornItems*(self: Character): Item =
    for slot in ClothingSlot.items:
        let (exists, item) = self.getWornItem(slot)
        if exists:
            yield item


# -------------------------------------
# Combat stats
# -------------------------------------

func getWeaponInfo*(self: Character): WeaponInfo =
    if self.weapon.kind == ItemType.weapon:
        return self.weapon.weaponInfo

proc get*(self: Character, stat: Stat): int =
    result = self.class.stats[stat] + self.statMods[stat]
    if not self.getWeaponInfo.getStat.isNil:
        result = self.getWeaponInfo.getStat(stat, result)
    for aura in self.auras:
        if not aura.getStat.isNil:
            result = aura.getStat(stat, result)

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

func numAbilites*(self: Character): int =
    for _ in self.iterAbilities:
        result += 1

func getAbility*(self: Character, index: int): Ability =
    var i = 0
    for ability in self.iterAbilities:
        if i == index: return ability
        i += 1

proc damage*(self: Character, damage: int, damageType: DamageType) =
    let damagePrevented =
        if damageType == DamageType.physical:
            self.get(Stat.armor)
        elif damageType == DamageType.magical:
            self.get(Stat.magicResist)
        else:
            0
    self.health -= damage - damagePrevented


# -------------------------------------
# Update
# -------------------------------------

func update*(self: Character, level: var Level, dt: float) =
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

func getBaseSpriteSheet(race: Race, sex: Sex): TextureAlias =
    case sex
    of male:
        race.baseSpritesheetMale
    of female:
        race.baseSpritesheetFemale

func getStaticSrcRect*(self: Character): sdl2.Rect =
    newSdlSquare(0, 0, TILE_SIZE)


func animationTimer*(self: Character): float {.inline.} =
    let distanceToMove = vecFloat(self.nextTile - self.currentTile)
    let distanceMoved = self.actualPos - vecFloat(self.currentTile)

    if distanceToMove.x != 0:
        abs(distanceMoved.x / distanceToMove.x)
    elif distanceToMove.y != 0:
        abs(distanceMoved.y / distanceToMove.y)
    else:
        0


func getSrcRect*(self: Character): sdl2.Rect =
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


func getDestRect*(self: Character): sdl2.Rect =
    newSdlSquare(int(round(self.actualPos.x * TILE_SIZE)),
                 int(round(self.actualPos.y * TILE_SIZE)),
                 TILE_SIZE)


# -------------------------------------
# Initialization
# -------------------------------------

proc newCharacter*(level: var Level,
                   pos: Vec2, speed: float, 
                   kind: CharacterType, race: Race, sex: Sex,
                   class: Class): Character =
    result = create(CharacterData)
    result.currentTile = pos
    result.nextTile = pos
    result.actualPos = vecFloat(pos)
    result.facing = Direction.down
    result.speed = speed #TODO speed should depend on type/class
    result.race = race
    result.sex = sex
    result.spritesheet = getBaseSpriteSheet(race, sex)
    result.class = class
    result.auras = newSeq[Aura]()
    result.ai = race.defaultAi
    result.unlockedAbilities = newSeq[Ability]()
    result.health = class.stats[Stat.maxHp]
    for ab in class.startingAbilities:
        result.unlockedAbilities.add(ab)
    level.dynamicEntities[pos] = result

import
    patty,
    random,
    math

import
    types,
    vector,
    character_utils


proc getRange*(self: Ability, weapon: WeaponInfo): float =
    if self.useWeaponRange:
        weapon.weaponRange
    else:
        self.abilityRange

proc isNone*(self: Ability): bool =
    self.name == "Rest"

proc getPosition*(self: AbilityTarget): Vec2 =
    match self:
        TargetCharacter(character: c):
            c.currentTile
        TargetTile(tile: t):
            t

proc canCast*(caster: Character, ability: Ability): bool =
    if ability.isValidCaster.isNil:
        true
    else:
        ability.isValidCaster(caster)

proc isNone*(self: AoeAura): bool =
    self.effect.isNil

proc getBasicDamage*(weapon: WeaponInfo, modifier=1.0): (int, bool) =
    if weapon.critChance >= rand(1.0):
        ((weapon.critBonus * weapon.baseDamage.float * modifier).round.toInt,
         true)
    else:
        ((weapon.baseDamage.float * modifier).round.toInt, false)


proc doesHit*(caster, target: Character): bool =
    let percentChance = caster.get(Stat.accuracy) - target.get(Stat.dodge)
    return rand(100) >= percentChance

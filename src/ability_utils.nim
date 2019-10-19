import
    random,
    math

import
    character_utils,
    constants,
    types


func turnCost*(cost: float): int =
    int(round(cost * ABILITY_POINTS_PER_TURN))


func isNone*(self: Ability): bool =
    self.name == "Rest"

proc canCast*(caster: Character, ability: Ability): bool =
    if ability.isValidCaster.isNil:
        true
    else:
        ability.isValidCaster(caster)

func isNone*(self: AoeAura): bool =
    self.effect.isNil

proc getBasicDamage*(weapon: WeaponInfo, modifier = 1.0): (int, bool) =
    if weapon.critChance >= rand(1.0):
        ((weapon.critBonus * weapon.baseDamage.float * modifier).round.toInt,
         true)
    else:
        ((weapon.baseDamage.float * modifier).round.toInt, false)


proc doesHit*(caster, target: Character): bool =
    let percentChance = caster.get(Stat.accuracy) - target.get(Stat.dodge)
    return rand(100) >= percentChance

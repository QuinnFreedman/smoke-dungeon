import patty

import
    types,
    vector


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

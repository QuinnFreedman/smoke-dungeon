import
    types


proc getRange*(self: Ability, weapon: WeaponInfo): float =
    if self.useWeaponRange:
        weapon.weaponRange
    else:
        self.abilityRange

proc isNone*(self: Ability): bool =
    self.name == "Rest"


proc canCast*(caster: Character, ability: Ability): bool =
    not (caster.health < ability.healthCost or
         caster.mana < ability.manaCost or
         caster.energy < ability.energyCost)

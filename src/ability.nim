import
    types,
    item


let BASIC_ATTACK*: Ability =
    Ability(
        name: "Basic Attack",
        useWeaponRange: true,
        abilityType: AbilityType.enemyTarget,
        applyEffect: proc (caster, target: var Character, weapon: Item) =
            target.health -= 1
    )

let HEAVY_ATTACK*: Ability =
    Ability(
        name: "Heavy Attack",
        useWeaponRange: true,
        abilityType: AbilityType.enemyTarget,
        energyCost: 2,
        applyEffect: proc (caster, target: var Character, weapon: Item) =
            target.health -= 2 #TODO placeholder
    )


proc getRange*(self: Ability, weapon: WeaponInfo): float =
    if self.useWeaponRange:
        weapon.weaponRange
    else:
        self.abilityRange

let NONE_ABILITY* = Ability(
    name: "Rest"
)

proc isNone*(self: Ability): bool =
    self.name == "Rest"


proc canCast*(caster: Character, ability: Ability): bool =
    not (caster.health < ability.healthCost or
         caster.mana < ability.manaCost or
         caster.energy < ability.energyCost)

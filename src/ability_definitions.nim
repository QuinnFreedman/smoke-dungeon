import
    types

let NONE_ABILITY* = Ability(
    name: "Rest"
)

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

let ZAP*: Ability =
    Ability(
        name: "Zap",
        useWeaponRange: false,
        abilityRange: 4,
        abilityType: AbilityType.enemyTarget,
        manaCost: 3,
        applyEffect: proc (caster, target: var Character, weapon: Item) =
            target.health -= 2 #TODO placeholder
    )

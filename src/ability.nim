import
    character,
    item

type
    Ability* = object
        abilityRange*: float #number of squares
        useWeaponRange*: bool #if true, ignore abilityRange and use the range of the weaoon the spell is channeled throug
        abilityType*: AbilityType #TODO add required fields for AOE spells
        energyCost*: int
        manaCost*: int
        healthCost*: int
        applyEffect*: proc(target, caster: var Character, weapon: Item)

    AbilityType* {.pure.} = enum
        enemyTarget, allyTarget, aoe

let BASIC_ATTACK: Ability =
    Ability(
        useWeaponRange: true,
        abilityType: AbilityType.enemyTarget,
        applyEffect: proc (target, caster: var Character, weapon: Item) =
            target.health -= 1
    )

#TODO awkawrd to have this here
iterator iterAbilities(self: Character): Ability =
    yield BASIC_ATTACK

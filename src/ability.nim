import
    character,
    item

type
    Ability* = object
        name*: string
        abilityRange*: float #number of squares
        useWeaponRange*: bool #if true, ignore abilityRange and use the range of the weaoon the spell is channeled throug
        abilityType*: AbilityType #TODO add required fields for AOE spells
        energyCost*: int
        manaCost*: int
        healthCost*: int
        applyEffect*: proc(caster, target: var Character, weapon: Item)

    AbilityType* {.pure.} = enum
        enemyTarget, allyTarget, aoe

let BASIC_ATTACK: Ability =
    Ability(
        name: "Basic Attack",
        useWeaponRange: true,
        abilityType: AbilityType.enemyTarget,
        applyEffect: proc (caster, target: var Character, weapon: Item) =
            target.health -= 1
    )

let HEAVY_ATTACK: Ability =
    Ability(
        name: "Heavy Attack",
        useWeaponRange: true,
        abilityType: AbilityType.enemyTarget,
        energyCost: 2,
        applyEffect: proc (caster, target: var Character, weapon: Item) =
            target.health -= 2 #TODO placeholder
    )

#TODO awkawrd to have this here
#TODO placeholder
iterator iterAbilities*(self: Character): Ability =
    yield BASIC_ATTACK
    yield HEAVY_ATTACK

proc numAbilites*(self: Character): int =
    for _ in self.iterAbilities:
        result += 1

proc getAbility*(self: Character, index: int): Ability =
    var i = 0
    for ability in self.iterAbilities:
        if i == index: return ability
        i += 1

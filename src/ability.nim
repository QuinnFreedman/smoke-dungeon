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
        applyEffect*: proc(target: Character, caster: Character, weapon: Item)

    AbilityType* {.pure.} = enum
        aoe, enemyTarget, allyTarget

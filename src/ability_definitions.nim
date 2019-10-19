import
    random,
    math,
    sugar,
    sequtils

import
    types,
    vector,
    textures,
    matrix,
    character_utils,
    ability_utils

let NONE_ABILITY* = Ability(
    name: "Rest",
    abilityType: AbilityType.untargeted
)


proc forRange[T](n: int, f: proc(x: int): T): seq[T] =
    for i in 0..n:
        result.add(f(i))


let RANGE_TEST* = Ability(
    name: "Ranged test",
    turnCost: turnCost(1),
    abilityType: AbilityType.ranged,
    movementPattern: @[@[v(1, 0)]],
    projectilePattern: @[forRange(10, x => v(x, x))],
    canJump: false
)

let RANGE_TEST_2* = Ability(
    name: "Ranged test 2",
    turnCost: turnCost(1),
    abilityType: AbilityType.ranged,
    movementPattern: @[@[v(1, 0)], @[v(1, 1)]],
    projectilePattern: @[@[v(1, 0)], @[v(1, 1)]],
    canJump: false
)

let TARGETED_ABILITY_TEST* = Ability(
    name: "Targeted test",
    turnCost: turnCost(1),
    abilityType: AbilityType.targeted
)

# func fire(caster: Character): AoeAura =
#     AoeAura(
#         turns: 2,
#         caster: caster,
#         texture: TextureAlias.fire,
#         effect: proc(character: Character) =
#             character.damage(2, DamageType.trueDamage)
#     )

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
    movementPattern: @[v(1, 0)],
    projectilePattern: forRange(10, x => v(x, x)),
    canJump: false
)

# func fire(caster: Character): AoeAura =
#     AoeAura(
#         turns: 2,
#         caster: caster,
#         texture: TextureAlias.fire,
#         effect: proc(character: Character) =
#             character.damage(2, DamageType.trueDamage)
#     )

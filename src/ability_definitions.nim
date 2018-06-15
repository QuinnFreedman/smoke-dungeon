import
    random,
    math

import
    types,
    vector,
    textures,
    matrix,
    character_utils,
    ability_utils

let NONE_ABILITY* = Ability(
    name: "Rest"
)


let BASIC_ATTACK* = Ability(
    name: "Basic Attack",
    useWeaponRange: true,
    abilityType: AbilityType.enemyTarget,
    applyEffect: proc (caster, target: Character, weaponInfo: WeaponInfo) =
        let damage = getBasicDamage(weaponInfo)[0]
        target.damage(damage, DamageType.physical)
)

let HEAVY_ATTACK* = Ability(
    name: "Heavy Attack",
    useWeaponRange: true,
    abilityType: AbilityType.enemyTarget,
    applyEffect: proc (caster, target: Character, weaponInfo: WeaponInfo) =
        let damage = getBasicDamage(weaponInfo, 2)[0]
        target.damage(damage, DamageType.physical)
)

let ZAP* = Ability(
    name: "Zap",
    useWeaponRange: false,
    abilityRange: 4,
    abilityType: AbilityType.enemyTarget,
    isMagical: true,
    applyEffect: proc (caster, target: Character, weaponInfo: WeaponInfo) =
        target.damage(2, DamageType.magical)
)

proc fire(caster: Character): AoeAura =
    AoeAura(
        turns: 2,
        caster: caster,
        texture: TextureAlias.fire,
        effect: proc(character: Character) =
            character.damage(2, DamageType.trueDamage)
    )

let BURN* = Ability(
    name: "Ignite",
    useWeaponRange: false,
    abilityRange: 4,
    abilityType: AbilityType.aoe,
    aoePattern: @[
        v(0,  0),
        v(0, -1),
        v(0,  1),
        v(-1, 0),
        v( 1, 0),
    ],
    applyAoeEffect: proc (caster: Character, target: Vec2,
                          weaponInfo: WeaponInfo,
                          combat: var CombatScreen) =
        combat.aoeAuras[target] = fire(caster)
)

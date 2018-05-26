import
    types,
    vector,
    textures,
    matrix

let NONE_ABILITY* = Ability(
    name: "Rest"
)

let BASIC_ATTACK* = Ability(
    name: "Basic Attack",
    useWeaponRange: true,
    abilityType: AbilityType.enemyTarget,
    applyEffect: proc (caster, target: Character, weapon: Item) =
        target.health -= 1
)

let HEAVY_ATTACK* = Ability(
    name: "Heavy Attack",
    useWeaponRange: true,
    abilityType: AbilityType.enemyTarget,
    energyCost: 2,
    applyEffect: proc (caster, target: Character, weapon: Item) =
        target.health -= 2 #TODO placeholder
)

let ZAP* = Ability(
    name: "Zap",
    useWeaponRange: false,
    abilityRange: 4,
    abilityType: AbilityType.enemyTarget,
    manaCost: 3,
    applyEffect: proc (caster, target: Character, weapon: Item) =
        target.health -= 2 #TODO placeholder
)

proc fire(caster: Character): AoeAura =
    AoeAura(
        turns: 2,
        caster: caster,
        texture: TextureAlias.fire,
        effect: proc(character: Character) = character.health -= 2
    )

let BURN* = Ability(
    name: "Ignite",
    useWeaponRange: false,
    abilityRange: 4,
    abilityType: AbilityType.aoe,
    manaCost: 4,
    aoePattern: @[
        v(0,  0),
        v(0, -1),
        v(0,  1),
        v(-1, 0),
        v( 1, 0),
    ],
    applyAoeEffect: proc (caster: Character, target: Vec2,
                          weapon: Item, combat: var CombatScreen) =
        combat.aoeAuras[target] = fire(caster)
)

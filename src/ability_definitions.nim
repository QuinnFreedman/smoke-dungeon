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

let FIRE = AoeAura(
    turns: 2,
    texture: TextureAlias.fire,
    effect: proc(character: Character) = character.health -= 2
)

let BURN* = Ability(
    name: "Ignite",
    useWeaponRange: false,
    abilityRange: 4,
    abilityType: AbilityType.aoe,
    manaCost: 4,
    applyAoeEffect: proc (caster: Character, target: Vec2,
                          weapon: Item, combat: var CombatScreen) =
        let effectedTiles = [
            target,
            target + v(0, -1),
            target + v(0,  1),
            target + v(-1, 0),
            target + v( 1, 0),
        ]
        for p in effectedTiles:
            combat.aoeAuras[p] = FIRE
)

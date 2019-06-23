import
    character_utils,
    combat/combat_logic,
    textures,
    types,
    utils,
    vector


let IRON_SHORTSWORD* = Weapon(
    name: "Iron Shortsword",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 2,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: 1,
        handedness: Handed.single
    )
)

let BLEED* = Aura(
    turns: 3,
    icon: TextureAlias.none,
    effect: Effect(
        onTurnStart: proc(character: Character, level: var Level, combat: var CombatScreen) = 
            character.health -= 1
    )
)

let STUN* = Aura(
    turns: 1,
    icon: TextureAlias.none,
    effect: Effect(
        onTurnStart: proc(character: Character, level: var Level, combat: var CombatScreen) = 
            discard goToNextTurn(combat, level)
    )
)

let KNOCKBACK_SWORD* = Weapon(
    name: "Repulsive Shortsword",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 2,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: 1,
        handedness: Handed.single,
        kineticAfterEffect: proc(caster, target: Character, level: var Level) =
            let dir = caster.currentTile.directionTo(target.currentTile)
            let newPos = target.currentTile + dir.directionVector
            target.teleport(newPos, target.currentTile.directionTo(newPos),
                            level)
    )
)

let BLEED_KNIFE* = Weapon(
    name: "Bloody Knife",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 1,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: 1,
        handedness: Handed.single,
        kineticAfterEffect: proc(caster, target: Character, level: var Level) =
            target.auras.add(BLEED)
    )
)

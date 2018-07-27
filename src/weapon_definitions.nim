import
    types,
    textures,
    utils,
    character_utils,
    vector


let IRON_SHORTSWORD* = Item(
    kind: ItemType.weapon,
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
    effect: proc(character: Character) = character.health -= 1
)

let KNOCKBACK_SWORD* = Item(
    kind: ItemType.weapon,
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

let BLEED_KNIFE* = Item(
    kind: ItemType.weapon,
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

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
                            level.collision)
    )
)

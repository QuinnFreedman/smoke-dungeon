import
    item,
    textures

let IRON_SHORTSWORD* = Item(
    kind: ItemType.weapon,
    name: "Iron Shortsword",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 2,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: AttackRange.melee,
        handedness: Handed.single
    )
)

let NONE_WEAPON* = Item(
    kind: ItemType.weapon,
    name: "Hands",
    icon: TextureAlias.basicSwordIcon,
    weaponInfo: WeaponInfo(
        baseDamage: 1,
        critChance: 0.2,
        critBonus: 0.5,
        weaponRange: AttackRange.melee,
        handedness: Handed.single
    )
)

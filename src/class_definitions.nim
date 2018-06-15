import
    types,
    ability_definitions

let CLASS_ROGUE* = Class(
    name: "Rogue",
    isMagicUser: false,
    stats: [
        10,  # maxHp
        0,   # armor
        0,   # magicResist
        5,   # initiative
        90,  # accuracy
        30,  # dodge
        5,   # strength
        0,   # intelect
        4,   # combatSpeed
        2,   # backpackCapacity
    ],
    startingAbilities: @[
        BASIC_ATTACK,
        HEAVY_ATTACK
    ]
)

let CLASS_WIZARD* = Class(
    name: "Wizard",
    isMagicUser: true,
    stats: [
        10,  # maxHp
        0,   # armor
        0,   # magicResist
        5,   # initiative
        90,  # accuracy
        10,  # dodge
        5,   # strength
        10,  # intelect
        4,   # combatSpeed
        2,   # backpackCapacity
    ],
    startingAbilities: @[
        BASIC_ATTACK,
        ZAP
    ]
)

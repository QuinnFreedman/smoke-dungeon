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
    ],
    startingAbilities: @[
        RANGE_TEST,
        RANGE_TEST_2,
        TARGETED_ABILITY_TEST
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
    ],
    startingAbilities: @[
        RANGE_TEST,
        RANGE_TEST_2,
        TARGETED_ABILITY_TEST
    ]
)

let CLASS_SPIDER* = Class(
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
    ],
    startingAbilities: @[
        RANGE_TEST_2
    ]
)
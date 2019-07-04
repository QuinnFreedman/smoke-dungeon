import
    types,
    textures,
    ai

proc makeAi(): AI =
    #TODO wierd hack... tuple literal gives type error
    result.worldMovement = AI_RANDOM
    result.chooseAttack = AI_COMBAT_DO_NOTHING


let RACE_SPIDER* = Race(
    name: "Spider",
    baseSpritesheetMale: TextureAlias.spider,
    baseSpritesheetFemale: TextureAlias.spider,
    defaultAI: makeAi()
)

let RACE_HUMAN* = Race(
    name: "Human",
    baseSpritesheetMale: TextureAlias.humanMaleBase,
    baseSpritesheetFemale: TextureAlias.humanFemaleBase
)

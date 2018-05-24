import
    types,
    ai

proc makeAi(): AI =
    #TODO wierd hack... tuple literal gives type error
    result.worldMovement = AI_RANDOM
    result.combatMovement = AI_COMBAT_NEAREST_ENEMY


let ROGUE* = Class(
    startingHealth: 10,
    startingEnergy: 10,
    defaultAi: makeAi()
)

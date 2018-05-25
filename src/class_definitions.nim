import
    types,
    ai

proc makeAi(): AI =
    #TODO wierd hack... tuple literal gives type error
    result.worldMovement = AI_RANDOM
    result.combatMovement = AI_COMBAT_MOVE_NEAREST_ENEMY
    result.chooseAttack = AI_COMBAT_ATTACK_NEAREST_ENEMY


let ROGUE* = Class(
    startingHealth: 10,
    startingEnergy: 10,
    defaultAi: makeAi()
)


type Class* = object
    startingHealth*: int
    startingEnergy*: int
    startingMana*: int



const ROGUE* = Class(
    startingHealth: 10,
    startingEnergy: 10
)

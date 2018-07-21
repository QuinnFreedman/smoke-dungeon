# Smoke

Synopsis:

> *You are visiting a remote village on the edge of the wild. A monster destroys the village in the night and then retreats into the wild lands, leaving a trail of destruction. The mayor offers a reward for the mosters head. You and many other monster hunters set out to track down the beast. Its trail leads you deep into the wild. Along the way, you fight many other monsters with strange powers, explore the forest, eat some weird plants, stop by some remote outposts, and encounter other hunters who may become allies or enemies*

## Levels

The game is divided into a number of levels.
1. A hand-crafted level of the destroid town with scattered NPC's who give conflicting accounts of the monster. The monster's trail leads East into the wild.
2. A number of procedurally generated levels. Each level mostly consists of a single winding path west-to-east that is clearly marked by the monsters tracks, with some small offshoots that might contain things of interest. Each level ends with a mini-boss that is another procedurally generated monster (or a breif encounter with the main beast mid way through the game). It also has a blacksmith or shop somewhere along the way and maybe some other hunters who you can recruit into your party. Every level (or couple levels) introduces a new, increasingly dark and forested biome)
3. The final bossfight where you confront the monster in its lair.

## NPC's

### Monsters

The monsters you see along the way are hand-crafted but randomly positioned. (Maybe we can figure out how to truely procedurally generate good mini bosses?) Large monsters (mini-bosses and some other random ones scattered through the level) drop parts of themselves when killed. These magical pieces (e.g. a horn, an eyeball, a tail) can be consumed to level up intrinsic stats and to unlock new abilities or can be traded to blacksmiths/shopkeepers for weapons.

#### Monster items

Each monster item is associated with some intrinsic stat(s). For example, a minotaur's horn might give +2 strength. Once you recover one of these items, you may have any character in your party consume it. If they do, they get that intrinsic benefit (or maybe detrement) as well as getting to unlock one new ability. This creates a tension: You really want to unlock a specific ability on your wizard but the strength buff would be waisted on him. Who do you give it to? You can also cary these items with you to use later or trade for weapons.

### Hunters

The other hunters you see are chosed from a fixed set of 6 characters who you will see over the course of every game. They each have their own unique appearence and move set. You can convince them to join your party, somethimes by fighting them. However, you can only have a max of 4 (3?) total hunters in your party at once. If you defeat a hunter but don't want to let them join your party, they may give you their weapon instead.

## Mechanics

### Combat and Exploration

The game has two modes. In exploration mode, it is a real-time, grid-based adventure where your party members (if you have any) follow behind the player character. When you approach an enemy, it transitions to combat mode which is a turn-based, grid-based strategy segment where you control all mebers of your party individually. In combat mode, each character takes turns moving and then performing one or more actions.

### Abilities

For allies, the actions they use in combat are skills that they can learn and level up. Each ability can cost a full turn or half a turn (allowing you to perform two small actions in one turn). Each character starts with two basic half-turn moves -- a simple melee attack based on strength and dexterity and another class-specific ability.

Additional abilities can be unlocked using monster relics. Each character/class has 4 additional abilities that can be unlocked. Each of those has 4 varients that form a diamond-tree shape. With the first point, you unlock the basic varient. Witht he next point, you can choose between two options to add some additional effect to the ability. Witht he third point, you unlock the abilities ultimate version, which is an improvement on the basic version which still keeps whatever you chose with your second point.

### Stats

Abilities are controlled by stats. The three primary combat stats are

* Strength
* Dexterity
* Wisdom

Additionally, there are defensive stats:

* Health
* Armor
   * Any time a character would take physical damage, their armor number is subtracted from that damage (but it can't be lowered below 1)
* Magic Resist
   * Works like armor but for magic
   * Much more rare
 * Dodge
   * Chance to dodge an ability entierly (subtracted from attacker's accuracy, with a cap)
   * Can't dodge AoE or non-targeted abilities
   
There are also a few miscellaneous stats (although these maybe could be governed by dexterity?):

* Accuracy
* Crit Chance
* Initiative/combat order
* Speed (number of tiles moved per turn in combat)

For example, an ability might do base damage `3 + .5 * strength`. This damage could be modified by other things like weapon effects and other abilities. Most abilities will probably be primarily governed by the main combat stats, but they could also be effected by armor, health, etc.

### Weapons

Weapons don't (usually) give simple stat bonuses. Instead, they alter the effects of certain abilities in different ways. For example, a magical staff might fork any single-target magical ability cast with it to effect two targets, but might have a chance to break if you try to perform a physical attack with it. An iron sword might cause bleeding when you land a physical attack but might stunt any magic cast through it.



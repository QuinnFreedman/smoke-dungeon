# Smoke

## TODO:

### Minor Changes

* allow/test multiple enemies in combat
* text caching system
* ~~swap places when you move toward an ally~~

### Major Features

* combat animations
* pick up items from bodies
* level up/progression system
* chain levels/descend/boss levels


* **add lots more items/abilities/enemy types/classes/ai behaviors**


## Skill Trees

Each class has a skill tree of 17 abilities shaped like this:

![](SkillTreeLayout.png)

Each quadrant represents following one of four gods and specializing in one type of skill. You start unlocking abilities from the outside in. You need to have already unlocked the two abilities below bellow an inner ability to unlock it.

In addition, each race has one **race ability** that is unlocked from the beginning for any member of that race and all characters have a **"Basic attack"** ability that performs a simple physical attack with no energy cost.

### Leveling up

Every time you kill a monster boss/mini-boss (or complete some other mini-quest) they drop a consumable item (like a tusk/horn/eye etc.). You can consume these items to allow a single character to unlock one ability. Each item also has a permanent stat buff effect like more health/magica/strength. Whichever character uses it to unlock their spell gains the effect.


# Classes:

There are 3 roles: DPS, Tank, Support. Each role has a magical and non-magical variant (class). Each class has their own unique skill tree and different starting stats. Each class is also limited in the types of weapons they can use. Ranged classes have bows "built in" and can use arrows as weapons. Other classes weapons overlap somewhat.

> The strength of magical spells scales with magika and physical abilities scale with strength. For simple damage/heal abilities, this just multiplies the effect size. For non-stat-based abilities, they might have two slightly different variants and you only get the extra effect if you are above a certain threshold of magic/strength

## Support:

### Wizard (conjurer)

Ranged magical class focused on utility. Good at crowd control and altering the battlefield. Can also (as an alternate skill tree?) conjure ally familiars, but can't do much damage on his own.

**Ability Ideas:**
* Specialization: Utility
    * Vines: Magically damage an enemy (a little bit) and summon vines around them that significantly slow movement through them for all characters (or just opponents?).
    * Teleport: Move an enemy or ally to another part of the battlefield
    * Summon wall: put an temporary wall on 3 tiles in a row. Walls can be attacked/destroyed by enemies. *(This might be a hard one to implement)*
    * Lesser ranged magical heal??
* Specialization: Conjuring
    * Familiar: Summon an allied creature to a tile. Stats/type of the creature depend on level.
    * Decoy: Summon a weak decoy that does no damage but taunts nearby enemies until it is destroyed
    * Raise dead?


### Ranger/Rogue/monk?

Some non-magical mostly-melee support-oriented class. Can set traps, perform non-magical (melee-range) healing, maybe do assassinations/backstabs in an alternate skill tree


**Ability Ideas:**
* Specialization: Utility
    * Trap: Put a trap/tripwire on the ground that, if an enemy walks over it, immobilizes/paralyzes them for a turn them and does some damage
    * Minor melee-range heal?
    * ...
* Specialization: Damage
    * Assassinate: requires a melee weapon. does a ton of damage if the target is already at low health
    * ...


## Tank

### Knight/Barbarian

Non-magical warrior. Takes a lot of damage and does a lot of physical melee damage.

**Ability Ideas:**
* Specialization: Tank
    * Taunt: force enemies to attack the knight next round
    * Defensive stance/shield/riposte: If an enemy attacks them before their next turn, prevent the damage and get a counter attack
    * Determination: for height energy cost, guarantee to not be brought below 1 health until next turn
    * Self-heal

* Specialization: Damage
    * Power attack: Costs extra energy and does extra damage
    * Some ability that does damage to themselves/makes them more vulnerable but does a ton of damage
    * Sweeping attack that al enemies in an arc

### Paladin

Magical warrior. Good at healing




## DPS

### Archer/ranger

A non-magical ranged damage-dealing unit. Any class can basic attack with a bow but the archer is extra good at it/has abilities that require/make use of a bow


### Mage/Plague Doctor/Sorcerer

A magical damage dealer

* Specialization: AOE
    * Ignite: light the ground on fire
    * Lightning: Send out a lightning bolt that damages all enemies in a line
    * ??

* Specialization: Single target
    * Fireball: Send out a fireball that does a tone of damage to the first enemy it hits in a direction
    * Set enemy on fire/magically poison them (damage over time)
    * ??


# Stats

Each character has numbers for all of the following sub-categories. Maybe the sub-categories are derived from the major characteristics but maybe they can be altered by items/consumables independently?

* Strength
    * Health
    * Physical weapon damage
        * We could make some weapons' (bows, knives) damage depend on dexterity instead, but then for a ranged DPS there is really no reason to put any points in strength. Maybe a tradeoff between accuracy/priority and raw damage is more interesting
    * Carrying capacity (backpack size)
    * Total energy pool size
        * *(maybe should be a dexterity thing)*
    * Energy regeneration speed
        * *(maybe should be fixed for all characters -- only level up pool size?)*
        * *(maybe should be a dexterity thing)*
* Dexterity
    * Dodge chance
    * Accuracy
    * Combat initiative
    * Speed
        * tiles/turn in combat as well as (maybe) out-of-combat speed
* Intelligence
    * Maybe magic resistance (if that is a stat we want to have)
    * Magica (magic damage/effect scale)
    * Mana pool size
    * Mana regeneration speed
        * *(maybe should be fixed for all characters -- only level up pool size?)*


# Weapon Ideas


* ~~Heavy club that does a lot of damage and knocks enemies back one tile, but with lower accuracy/higher chance to miss~~
* ~~Sword that gives you back mana every time you hit someone~~
* ~~Sword that gives you back health every time you hit someone~~
* ~~Bow that shoots an additional arrow at a random enemy every time you shoot it~~
* ~~Staff that makes the AOE bigger every time you cast an AOE ability through it~~
* ~~Staff that increases healing every time you cast a healing spell through it~~
* ~~Staff that makes any targeted spell hit a random enemy instead, but does bonus damage to compensate~~
* ~~Knife that adds a bleed or poison effect every time you hit with it~~
* ~~Weapon that always crits when it hits~~
* ~~Weapon that always hits~~
* ~~Weapon with small chance to instantly kill non-boss target~~


## Base weapons

Each base weapon type has different ranges and different base stats. To generate new weapons these stats are randomly tweaked a bit (maybe based on level) and then zero or more special physical effects and zero or more magical effects are added (including maybe negative effects).

### Base weapon stats

* range
* physical damage
* accuracy
* crit chance
* crit bonus
* magica multiplier/bonus (for spells channeled through this weapon)

### Base weapon types

* Sword
* Knife/dagger
* Hammer/club
* Axe
* Staff
* Wand
* Spear/polearm
    * Slightly longer range (maybe can attack diagonally?)
* Arrows
    * Instead of bows being weapons, some classes come with built-in bows and those classes can equip different kinds of arrows and use them as ranged weapons
    * Arrows never run out/don't keep track of individuals
* Shield
    * Maybe just extra armor that takes up a weapon slot


## Weapon Effects

* Blind: Reduce opponent's accuracy for their next turn
* Magical: Does magical damage when used as a physical weapon
* Bonus to healing
* Healing has a chance to remove a curse/negative effect
* Fear: Critical hit causes enemy to run in opposite direction and lose their next turn
* Knockback: Hit knocks one square backwards
* Random knockback: knocks in a random direction
* Bleed/Poison: DOT effect
   * Bleeding also reduces healing effects
   * Poison also reduces evasion/dodge chance?
* Double/triple crit bonus
* Hit/crit permanently damages enemy armor
* (For ranged weapon): Damage increases with range
* (For ranged weapon): Shot pierces target and continues to a second target in a line
* Regain health/mana/energy on hit
* Chance to stun on hit (target loses their next turn)
* Freeze: hit reduces target's speed (movement range) next turn
* On hit gain some armor until the end of the fight
* Attack attacks a random additional target in range (pretty op for ranged weapons but more situational/tactical for melee)
* Do bonus damage relative to self missing health
* Do bonus damage relative to target missing health
* Hit drains target's mana/energy
* Makes magical AOE effects have a bigger AOE
* Bonus to certain type of attack (e.g. magical direct damage attacks)
* Bonus to accuracy
* Chance to instantly kill target

### Negative effects

* Fragile: physical attacks have a chance to destroy the weapon
* Volatile: When used for magic a magic ability, that ability has a chance to target a random other target instead (ally or enemy)
* Unwieldy: Chance to damage yourself

could not source "$VIM\sysinit.vim"
sourcing "C:\Users\Quinn Freedman\AppData\Local\nvim\init.vim"
Searching for "autoload/plug.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\autoload/plug.vim"
line 2: sourcing "C:\Users\Quinn Freedman\AppData\Local\nvim\autoload\plug.vim"
finished sourcing C:\Users\Quinn Freedman\AppData\Local\nvim\autoload\plug.vim
continuing in C:\Users\Quinn Freedman\AppData\Local\nvim\init.vim
Searching for "filetype.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\filetype.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\filetype.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\filetype.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\filetype.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\filetype.vim"
line 83: sourcing "C:\Program Files\Neovim\share\nvim\runtime\filetype.vim"
Searching for "ftdetect/*.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ftdetect/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\ftdetect/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\ftdetect/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\ftdetect/*.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\ftdetect/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\ftdetect/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\ftdetect/*.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\ftdetect/*.vim"
not found in 'runtimepath': "ftdetect/*.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\filetype.vim
continuing in function plug#end
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\filetype.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\filetype.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\filetype.vim"
Searching for "ftplugin.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ftplugin.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\ftplugin.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\ftplugin.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\ftplugin.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\ftplugin.vim"
line 83: sourcing "C:\Program Files\Neovim\share\nvim\runtime\ftplugin.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\ftplugin.vim
continuing in function plug#end
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\ftplugin.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\ftplugin.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\ftplugin.vim"
Searching for "indent.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\indent.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\indent.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\indent.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\indent.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\indent.vim"
line 83: sourcing "C:\Program Files\Neovim\share\nvim\runtime\indent.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\indent.vim
continuing in function plug#end
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\indent.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\indent.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\indent.vim"
line 86: sourcing "C:\Program Files\Neovim\share\nvim\runtime\syntax\syntax.vim"
Searching for "syntax/synload.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\syntax/synload.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\syntax/synload.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\syntax/synload.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\syntax/synload.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\syntax/synload.vim"
line 19: sourcing "C:\Program Files\Neovim\share\nvim\runtime\syntax\synload.vim"
Searching for "syntax/syncolor.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\syntax/syncolor.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\syntax/syncolor.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\syntax/syncolor.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\syntax/syncolor.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\syntax/syncolor.vim"
line 21: sourcing "C:\Program Files\Neovim\share\nvim\runtime\syntax\syncolor.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\syntax\syncolor.vim
continuing in C:\Program Files\Neovim\share\nvim\runtime\syntax\synload.vim
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\syntax/syncolor.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\syntax/syncolor.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\syntax/syncolor.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\syntax\synload.vim
continuing in C:\Program Files\Neovim\share\nvim\runtime\syntax\syntax.vim
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\syntax\syntax.vim
continuing in function plug#end
finished sourcing C:\Users\Quinn Freedman\AppData\Local\nvim\init.vim
Searching for "pack/*/start/*" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\pack/*/start/*"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\pack/*/start/*"
not found in 'packpath': "pack/*/start/*"
Searching for "plugin/**/*.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\plugin/**/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\plugin/**/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\plugin/**/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\plugin/**/*.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\plugin/**/*.vim"
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\gzip.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\gzip.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\health.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\health.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\man.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\man.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\matchit.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\matchit.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\matchparen.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\matchparen.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\netrwPlugin.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\netrwPlugin.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\rplugin.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\rplugin.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\rrhelper.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\rrhelper.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\shada.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\shada.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\spellfile.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\spellfile.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\tarPlugin.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\tarPlugin.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\tohtml.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\tohtml.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\tutor.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\tutor.vim
sourcing "C:\Program Files\Neovim\share\nvim\runtime\plugin\zipPlugin.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\plugin\zipPlugin.vim
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\plugin/**/*.vim"
sourcing "C:\Program Files\Neovim\share\nvim-qt\runtime\plugin\nvim_gui_shim.vim"
finished sourcing C:\Program Files\Neovim\share\nvim-qt\runtime\plugin\nvim_gui_shim.vim
Searching for "pack/*/start/*" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\pack/*/start/*"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\pack/*/start/*"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\pack/*/start/*"
not found in 'packpath': "pack/*/start/*"
Searching for "plugin/**/*.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\plugin/**/*.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\plugin/**/*.vim"
not found in 'runtimepath': "plugin/**/*.vim"
Reading ShaDa file "C:\Users\Quinn Freedman\AppData\Local\nvim-data\shada\main.shada" info marks oldfiles
Executing BufEnter Auto commands for "*"
autocommand sil call s:LocalBrowse(expand("<amatch>"))

Executing VimEnter Auto commands for "*"
autocommand sil call s:VimEnter(expand("<amatch>"))

Searching for "autoload/provider/clipboard.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\autoload/provider/clipboard.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\autoload/provider/clipboard.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\autoload/provider/clipboard.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\autoload/provider/clipboard.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\autoload/provider/clipboard.vim"
sourcing "C:\Program Files\Neovim\share\nvim\runtime\autoload\provider\clipboard.vim"
finished sourcing C:\Program Files\Neovim\share\nvim\runtime\autoload\provider\clipboard.vim
Executing CursorMoved Auto commands for "*"
autocommand call s:Highlight_Matching_Pair()

Executing TextChanged Auto commands for "*"
autocommand call s:Highlight_Matching_Pair()

Searching for "plugin/nvim_gui_shim.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\plugin/nvim_gui_shim.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\plugin/nvim_gui_shim.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\plugin/nvim_gui_shim.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\plugin/nvim_gui_shim.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\plugin/nvim_gui_shim.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\plugin/nvim_gui_shim.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\plugin/nvim_gui_shim.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\plugin/nvim_gui_shim.vim"
sourcing "C:\Program Files\Neovim\share\nvim-qt\runtime\plugin\nvim_gui_shim.vim"
finished sourcing C:\Program Files\Neovim\share\nvim-qt\runtime\plugin\nvim_gui_shim.vim
Searching for "ginit.vim" in "C:\Users\Quinn Freedman\AppData\Local\nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim,C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim,C:\Users\Quinn Freedman\AppData\Local\nvim\site,C:\Program Files\Neovim\share\nvim\runtime,C:\Users\Quinn Freedman\AppData\Local\nvim\site\after,C:\Users\Quinn Freedman\AppData\Local\nvim\after,C:/Program Files/Neovim/share/nvim-qt/runtime"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ginit.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\ctrlp.vim\ginit.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\deoplete.nvim\ginit.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\ginit.vim"
Searching for "C:\Program Files\Neovim\share\nvim\runtime\ginit.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\site\after\ginit.vim"
Searching for "C:\Users\Quinn Freedman\AppData\Local\nvim\after\ginit.vim"
Searching for "C:/Program Files/Neovim/share/nvim-qt/runtime\ginit.vim"
not found in 'runtimepath': "ginit.vim"

Writing ShaDa file "C:\Users\Quinn Freedman\AppData\Local\nvim-data\shada\main.shada"
Executing VimLeave Auto commands for "*"
autocommand call GuiClose()

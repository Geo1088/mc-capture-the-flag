# Steal Red - When the red flag is stolen.

# Physical replacement/effects
execute at @e[team=RedData] run setblock ~ ~-1 ~ minecraft:air replace
execute at @e[team=RedData] run particle minecraft:smoke ~ ~-1 ~ 0.5 1 0.5 0.15 200
replaceitem entity @p[scores={StealsFlag=1},team=Blue] armor.head minecraft:red_banner{BlockEntityTag:{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]}}
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag stolen!\"",CustomNameVisible:1b}

# Text
tellraw @a[team=Red] [{"selector": "@p[scores={StealsFlag=1},team=Blue]", "color": "yellow"}, " has ", {"text": "stolen your flag!", "color": "gold"}]
tellraw @a[team=Blue,scores={StealsFlag=1}] [{"text": "You've stolen the enemy flag!", "color": "green"}]
tellraw @a[team=Blue,scores={StealsFlag=0}] [{"selector": "@p[scores={StealsFlag=1},team=Blue]", "color": "yellow"}, " has ", {"text": "stolen the enemy flag!", "color": "green"}]

# Sound
# TODO: is there an easier way to do sound than this execute thing?
execute as @a[team=Blue,scores={StealsFlag=1}] at @s run playsound minecraft:entity.experience_orb.pickup master @s
execute as @a[team=Red] at @s run playsound minecraft:entity.generic.explode master @s

# Hook
execute as @p[scores={StealsFlag=1},team=Blue] at @s run function #geo1088.ctf:hooks/steal

# Scoreboard handling
scoreboard players set @e[team=RedData] FlagPresent 0
scoreboard players set @p[scores={StealsFlag=1},team=Blue] CarryingRedFlag 1

# Done!
scoreboard players set @p[scores={StealsFlag=1},team=Blue] StealsFlag 0

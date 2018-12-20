# Steal Blue - When the blue flag is stolen.

# Physical replacements/effects
execute at @e[team=BlueData] run setblock ~ ~-1 ~ minecraft:air replace
execute at @e[team=BlueData] run particle minecraft:smoke ~ ~-1 ~ 0.5 1 0.5 0.15 200
replaceitem entity @p[scores={StealsFlag=1},team=Red] armor.head minecraft:blue_banner{BlockEntityTag:{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]}}
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag stolen!\"",CustomNameVisible:1b}

# Text
tellraw @a[team=Blue] [{"color": "gold", "text": "> "}, {"selector": "@p[scores={StealsFlag=1},team=Red]", "color": "red"}, {"color": "reset", "text": " has "}, {"text": "stolen your flag!", "color": "gold"}]
tellraw @a[team=Red] [{"color": "green", "text": "> "}, {"selector": "@p[scores={StealsFlag=1},team=Red]", "color": "red"}, {"color": "reset", "text": " has "}, {"text": "stolen the enemy flag!", "color": "green"}]

# Sound
# TODO: is there an easier way to do sound than this execute thing?
execute as @a[team=Red,scores={StealsFlag=1}] at @s run playsound minecraft:entity.experience_orb.pickup master @s
execute as @a[team=Blue] at @s run playsound minecraft:entity.generic.explode master @s

# Hook
execute as @p[scores={StealsFlag=1},team=Blue] at @s run function #geo1088.ctf:hooks/steal

# Scoreboard handling
scoreboard players set @e[team=BlueData] FlagPresent 0
scoreboard players set @p[scores={StealsFlag=1},team=Red] CarryingBlueFlag 1

# Done!
scoreboard players set @p[scores={StealsFlag=1},team=Red] StealsFlag 0

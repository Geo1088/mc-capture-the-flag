# Capture Blue - When the blue flag is captured.

# Scoreboard handling
scoreboard players set @p[scores={CapturesFlag=1},team=!Blue] CarryingBlueFlag 0
scoreboard players set @e[team=BlueData,limit=1] FlagPresent 1

# Physical replacements/etc
execute at @e[team=BlueData] run setblock ~ ~-1 ~ blue_banner[rotation=8]{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]} replace
replaceitem entity @p[scores={CapturesFlag=1},team=!Blue] armor.head minecraft:air
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# Particles at the other team's base
execute at @e[team=RedData] run particle minecraft:flame ~ ~-1 ~ 0.2 0.5 0.2 0.04 100
execute at @e[team=RedData] run particle minecraft:item minecraft:red_wool ~ ~-1 ~ 0 1 0 0.5 100
execute at @e[team=RedData] run particle minecraft:item minecraft:white_wool ~ ~-1 ~ 0 1 0 0.25 50

# Text
tellraw @a[team=Blue] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured your flag!", "color": "gold"}, {"text": " Red Wins!", "color": "red"}]
tellraw @a[team=!Blue,scores={CapturesFlag=1}] [{"text": "You've captured the enemy flag!", "color": "green"}, {"text": " Red Wins!", "color": "red"}]
tellraw @a[team=!Blue,scores={CapturesFlag=0}] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured the enemy flag!", "color": "green"}, {"text": " Red Wins!", "color": "red"}]

# Sounds
execute as @a[team=!Blue] at @s run playsound minecraft:entity.firework.twinkle_far master @s
execute as @a[team=Blue] at @s run playsound minecraft:entity.generic.explode master @s

# Done!
scoreboard players set @p[scores={CapturesFlag=1},team=!Blue] CapturesFlag 0

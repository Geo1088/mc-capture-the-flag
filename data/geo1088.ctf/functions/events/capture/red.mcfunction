# Capture Red - When the red flag is captured.

# Scoreboard handling
scoreboard players set @p[scores={CapturesFlag=1},team=!Red] CarryingRedFlag 0
scoreboard players set @e[team=RedData,limit=1] FlagPresent 1

# Physical replacements/etc
execute at @e[team=RedData] run setblock ~ ~-1 ~ red_banner{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
replaceitem entity @p[scores={CapturesFlag=1},team=!Red] armor.head minecraft:air
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# Particles at the other team's base
execute at @e[team=BlueData] run particle minecraft:flame ~ ~-1 ~ 0.2 0.5 0.2 0.04 100
execute at @e[team=BlueData] run particle minecraft:item minecraft:blue_wool ~ ~-1 ~ 0 1 0 0.5 100
execute at @e[team=BlueData] run particle minecraft:item minecraft:white_wool ~ ~-1 ~ 0 1 0 0.25 50

# Text
tellraw @a[team=Red] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured your flag!", "color": "gold"}, {"text": " Blue Wins!", "color": "blue"}]
tellraw @a[team=!Red,scores={CapturesFlag=1}] [{"text": "You've captured the enemy flag!", "color": "green"}, {"text": " Blue Wins!", "color": "blue"}]
tellraw @a[team=!Red,scores={CapturesFlag=0}] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured the enemy flag!", "color": "green"}, {"text": " Blue Wins!", "color": "blue"}]

# Sounds
execute as @a[team=!Red] at @s run playsound minecraft:entity.firework.twinkle_far master @s
execute as @a[team=Red] at @s run playsound minecraft:entity.generic.explode master @s

# Done!
scoreboard players set @p[scores={CapturesFlag=1},team=!Red] CapturesFlag 0

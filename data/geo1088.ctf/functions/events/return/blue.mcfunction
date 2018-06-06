# TODO
say hi
# Return Blue - When the blue flag is returned.
scoreboard players set @p[scores={CarryingBlueFlag=1,Health=0},team=Red] CarryingBlueFlag 0
scoreboard players set @e[team=BlueData,limit=1] FlagPresent 1

execute at @e[team=BlueData] run setblock ~ ~-1 ~ blue_banner[rotation=8]{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]} replace
# replaceitem entity @p[scores={CapturesFlag=1},team=Red] armor.head minecraft:air
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# tellraw @a[team=Blue] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has died. Your flag has been ", {"text": "returned.", "color": "green"}]
# tellraw @a[team=Red,scores={CapturesFlag=1}] [{"text": "The flag has been returned.", "color": "gold"}]
# tellraw @a[team=Red,scores={CapturesFlag=0}] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has died. The enemy flag has been ", {"text": "returned.", "color": "gold"}]

scoreboard players set @p[scores={CapturesFlag=1},team=Red] CapturesFlag 0

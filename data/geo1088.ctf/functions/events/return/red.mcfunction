# TODO
say yo
# Return Red - When the red flag is returned.
scoreboard players set @p[scores={CarryingRedFlag=1,Health=0},team=Blue] CarryingRedFlag 0
scoreboard players set @e[team=RedData,limit=1] FlagPresent 1

execute at @e[team=RedData] run setblock ~ ~-1 ~ red_banner[rotation=0]{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
# replaceitem entity @p[scores={CapturesFlag=1},team=Blue] armor.head minecraft:air
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# tellraw @a[team=Red] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured your flag!", "color": "gold"}, {"text": " Red Wins!", "color": "red"}]
# tellraw @a[team=Blue,scores={CapturesFlag=1}] [{"text": "You've captured the enemy flag!", "color": "green"}, {"text": " Red Wins!", "color": "red"}]
# tellraw @a[team=Blue,scores={CapturesFlag=0}] [{"selector": "@p[scores={CapturesFlag=1}]", "color": "yellow"}, " has ", {"text": "captured the enemy flag!", "color": "green"}, {"text": " Red Wins!", "color": "red"}]

scoreboard players set @p[scores={CapturesFlag=1},team=Blue] CapturesFlag 0

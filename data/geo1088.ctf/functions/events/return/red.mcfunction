# Return Red - When the red flag is returned.

# Physical replacement
setblock ~ ~-1 ~ red_banner[rotation=0]{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# Chat
tellraw @a[team=Red] [{"selector": "@p[scores={IsDead=1,CarryingRedFlag=1}]", "color": "blue"}, {"color": "reset", "text": " has died. Your flag has been "}, {"text": "restored.", "color": "green"}]
tellraw @a[team=Blue] [{"selector": "@p[scores={IsDead=1,CarryingRedFlag=1}]", "color": "blue"}, {"color": "reset", "text": " has died. The enemy flag has been "}, {"text": "restored.", "color": "gold"}]

# Scoreboard stuff
scoreboard players set @a[scores={IsDead=1,CarryingRedFlag=1}] CarryingRedFlag 0
scoreboard players set @e[team=RedData] FlagPresent 1

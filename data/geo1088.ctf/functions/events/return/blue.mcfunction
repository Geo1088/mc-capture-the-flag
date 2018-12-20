# Return Blue - When the blue flag is returned.

# Physical replacement
setblock ~ ~-1 ~ blue_banner[rotation=0]{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]} replace
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# Chat
tellraw @a[team=Blue] [{"color": "green", "text": "> "}, {"selector": "@p[scores={IsDead=1,CarryingBlueFlag=1}]", "color": "red"}, {"color": "reset", "text": " has died. Flag "}, {"text": "restored.", "color": "green"}]
tellraw @a[team=Red] [{"color": "gold", "text": "> "}, {"selector": "@p[scores={IsDead=1,CarryingBlueFlag=1}]", "color": "red"}, {"color": "reset", "text": " has died. Enemy flag "}, {"text": "restored.", "color": "gold"}]

# Scoreboard stuff
scoreboard players set @a[scores={IsDead=1,CarryingBlueFlag=1}] CarryingBlueFlag 0
scoreboard players set @e[team=BlueData] FlagPresent 1

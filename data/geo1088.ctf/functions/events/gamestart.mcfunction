# Game start - Reset scoreboard objectives and things

scoreboard players set @a StealsFlag 0
scoreboard players set @a ReplacesFlag 0
scoreboard players set @a CapturesFlag 0
scoreboard players set @a CarryingRedFlag 0
scoreboard players set @a CarryingBlueFlag 0

execute at @e[team=RedData] run setblock ~ ~-1 ~ red_banner[rotation=0]{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
scoreboard players set @e[team=RedData] FlagPresent 1
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

execute at @e[team=BlueData] run setblock ~ ~-1 ~ blue_banner[rotation=8]{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]} replace
scoreboard players set @e[team=BlueData] FlagPresent 1
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

tellraw @a "did things"

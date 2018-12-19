# Game start - Reset scoreboard objectives and things

# Reset scoreboard
scoreboard players set @a StealsFlag 0
scoreboard players set @a ReplacesFlag 0
scoreboard players set @a CapturesFlag 0
scoreboard players set @a CarryingRedFlag 0
scoreboard players set @a CarryingBlueFlag 0

# Replace banners
execute at @e[team=RedData] run setblock ~ ~-1 ~ minecraft:red_banner[rotation=0]{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
scoreboard players set @e[team=RedData] FlagPresent 1
data merge entity @e[team=RedData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

execute at @e[team=BlueData] run setblock ~ ~-1 ~ minecraft:blue_banner[rotation=8]{Patterns:[{Pattern:rd,Color:3},{Pattern:sc,Color:0}]} replace
scoreboard players set @e[team=BlueData] FlagPresent 1
data merge entity @e[team=BlueData,limit=1] {CustomName:"\"Flag present\"",CustomNameVisible:0b}

# Disable team switching by resetting scores o zero (triggers are disabled whenever the objective is updated)
scoreboard players set @a JoinsRed 0
scoreboard players set @a JoinsBlue 0
scoreboard players set @a JoinsSpec 0

# Allow other datapacks to hook into this event by redefining this tag
# Maps can use this hook to teleport players to their starting points
function #geo1088.ctf:hooks/gamestart

# Set spectators to spectator mode
gamemode spectator @a[team=Spectators]

# Reset trigger and start game
scoreboard players set @a StartGame 0
scoreboard players set @e[team=GameData] InGame 1
tellraw @a [{"text": "> ", "color": "green"}, {"color": "reset", "text": "Game started!"}]

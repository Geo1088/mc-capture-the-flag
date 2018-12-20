# Game stop - when the game ends

# Allow other datapacks to hook into this event by redefining this tag
# Maps can use this hook to teleport players back to the hub area
function #geo1088.ctf:hooks/gamestop

# Put spectators back into adventure mode
gamemode adventure @a[team=Spectators,gamemode=spectator]

# Stop game
scoreboard players set @e[team=GameData] InGame 0
scoreboard players set @a StopGame 0
tellraw @a [{"color": "gold", "text": "> "}, {"color": "reset", "text": "Game stopped."}]

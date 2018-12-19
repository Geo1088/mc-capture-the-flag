# Hub loop - When players are in the hub (out of game)

# Handle joining users to teams (/trigger method)
team join Red @a[scores={JoinsRed=1}]
tellraw @a[scores={JoinsRed=1}] [{"text": "@ ", "color": "gray"}, "You have joined the ", {"text": "Red Team!", "color": "red"}]
scoreboard players set @a[scores={JoinsRed=1}] JoinsRed 0

team join Blue @a[scores={JoinsBlue=1}]
tellraw @a[scores={JoinsBlue=1}] [{"text": "@ ", "color": "gray"}, "You have joined the ", {"text": "Blue Team!", "color": "blue"}]
scoreboard players set @a[scores={JoinsBlue=1}] JoinsBlue 0

team join Spectators @a[scores={JoinsSpec=1}]
tellraw @a[scores={JoinsSpec=1}] [{"text": "@ ", "color": "gray"}, "You are now spectating."]
scoreboard players set @a[scores={JoinsSpec=1}] JoinsSpec 0

# Re-enable triggers every tick for tellraw interface
scoreboard players enable @a JoinsRed
scoreboard players enable @a JoinsBlue
scoreboard players enable @a JoinsSpec
scoreboard players enable @a StartGame
scoreboard players enable @a StopGame

# Prevent double-clicking the stop button from queueing an immediate stop of the next game
scoreboard players set @a StopGame 0

# Handle the start button
execute if entity @a[scores={StartGame=1}] run function geo1088.ctf:events/gamestart

# TODO: Only do this while in a game.
function geo1088.ctf:game

# Handle joining users to teams (/trigger method)
team join Red @a[scores={JoinsRed=1}]
scoreboard players set @a[scores={JoinsRed=1}] JoinsRed 0
team join Blue @a[scores={JoinsBlue=1}]
scoreboard players set @a[scores={JoinsBlue=1}] JoinsBlue 0
team join Spectators @a[scores={JoinsSpec=1}]
scoreboard players set @a[scores={JoinsSpec=1}] JoinsSpec 0

# Re-enable team join triggers every tick (TODO: only handle when needed?)
scoreboard players enable @a JoinsRed
scoreboard players enable @a JoinsBlue
scoreboard players enable @a JoinsSpec

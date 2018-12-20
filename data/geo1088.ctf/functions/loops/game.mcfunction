# Game - Thein-game logic.

# When a player is within 3 blocks of the opposing team's flag, they take it.
execute at @e[team=RedData,scores={FlagPresent=1}] run scoreboard players set @p[distance=..3,scores={CarryingRedFlag=0},team=Blue] StealsFlag 1
execute if entity @p[scores={StealsFlag=1},team=Blue] run function geo1088.ctf:events/steal/red
execute at @e[team=BlueData,scores={FlagPresent=1}] run scoreboard players set @p[distance=..3,scores={CarryingBlueFlag=0},team=Red] StealsFlag 1
execute if entity @p[scores={StealsFlag=1},team=Red] run function geo1088.ctf:events/steal/blue

# When a player is within 3 blocks of his own base while holding the opposing
# team's flag, they capture it.
execute at @e[team=RedData] run scoreboard players set @p[distance=..3,scores={CarryingBlueFlag=1},team=Red] CapturesFlag 1
execute if entity @p[scores={CapturesFlag=1},team=Blue] run function geo1088.ctf:events/capture/red
execute at @e[team=BlueData] run scoreboard players set @p[distance=..3,scores={CarryingRedFlag=1},team=Blue] CapturesFlag 1
execute if entity @p[scores={CapturesFlag=1},team=Red] run function geo1088.ctf:events/capture/blue

# If a flag is missing and no one has it, return it. (The person carrying it
# probably died.)
execute as @e[team=RedData,scores={FlagPresent=0}] at @s unless entity @p[scores={CarryingRedFlag=1,IsDead=0}] run function geo1088.ctf:events/return/red
execute as @e[team=BlueData,scores={FlagPresent=0}] at @s unless entity @p[scores={CarryingBlueFlag=1,IsDead=0}] run function geo1088.ctf:events/return/blue

# Prevent the use of buttons other than the stop button
scoreboard players set @a StartGame 0
scoreboard players set @a JoinsRed 0
scoreboard players set @a JoinsBlue 0
scoreboard players set @a JoinsSpecs 0

# Reset death objective after one tick
scoreboard players set @a IsDead 0

# Remove banners from the heads of players with 0 health (i.e. just respawned)
replaceitem entity @a[scores={Health=0}] armor.head minecraft:air

# Hande stop button (normally inaccessible but exists for debugging)
execute if entity @a[scores={StopGame=1}] run function geo1088.ctf:events/gamestop

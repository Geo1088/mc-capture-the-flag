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
execute at @e[team=RedData,scores={FlagPresent=0}] if entity @p[scores={CarryingRedFlag=1,Health=0}] run function geo1088.ctf:events/return/red
execute at @e[team=BlueData,scores={FlagPresent=0}] if entity @p[scores={CarryingBlueFlag=1,Health=0}] run function geo1088.ctf:events/return/blue

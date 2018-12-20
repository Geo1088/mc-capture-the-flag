# Main loop - Runs every tick

# Run game loop if in game
execute if entity @e[team=GameData,scores={InGame=1}] run function geo1088.ctf:loops/game
# Run hub loop otherwise
execute unless entity @e[team=GameData,scores={InGame=1}] run function geo1088.ctf:loops/hub

# Below are debugging/mapmaking utilities that always run

# Handle placing banners via eggs
execute as @e[type=minecraft:mooshroom,name="Red Flag"] at @s run function geo1088.ctf:events/initflag/red
execute as @e[type=minecraft:squid,name="Blue Flag"] at @s run function geo1088.ctf:events/initflag/blue

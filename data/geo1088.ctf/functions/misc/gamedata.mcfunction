# gamedata - Initialize the gamedata armorstand.

kill @e[type=minecraft:armor_stand,team=GameData]
summon minecraft:armor_stand ~ ~ ~ {CustomName:"\"Game Data\"",CustomNameVisible:1b,Marker:1b,Invisible:1b,NoGravity:1b}
team join GameData @e[type=minecraft:armor_stand,distance=..1]

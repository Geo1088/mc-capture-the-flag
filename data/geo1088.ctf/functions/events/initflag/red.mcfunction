# Places the red banner and kills the calling mob.

setblock ~ ~ ~ minecraft:red_banner[rotation=0]{Patterns:[{Pattern:rd,Color:6},{Pattern:sc,Color:0}]} replace
summon minecraft:armor_stand ~ ~1 ~ {CustomName:"\"Flag Present\"",CustomNameVisible:0b,Marker:1b,NoGravity:1b,Invisible:1b}
team join RedData @e[type=minecraft:armor_stand,distance=..1]
kill @s

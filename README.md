# Capture the Flag

A Minecraft datapack that introduces the mechanics of a traditional Capture the Flag game. Currently being developed in 18w09a because I haven't played in a while and my school blocks update downloads. Forward-compatibility unknown.

## Documentation

soon:tm:

tldr the following function tags are run at various points in the game cycle:

- `geo1088.ctf:gamestart`
- `geo1088.ctf:gamestop`
- more to come uwu

## Commands for setting up the world

Red sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Join Red Team]\",\"color\":\"red\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsRed set 1\"}}"}

Spectator sign:

    /data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Spectate]\",\"color\":\"dark_gray\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsSpec set 1\"}}"}

Blue sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Join Blue Team]\",\"color\":\"blue\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsBlue set 1\"}}"}

Start sign:

	/data merge block ~ ~ ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Start Game]\",\"color\":\"dark_green\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\",\"value\":\"/trigger StartGame set 1\"}}"}

Stop sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Stop Game]\",\"color\":\"dark_purple\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\",\"value\":\"/trigger StopGame set 1\"}}"}

Dev mode sign:

	/data merge block ~ ~ ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Enable Dev]\",\"color\":\"aqua\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\", \"value\":\"execute as @p at @s run function .ctf:dev\"}}"}

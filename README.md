# Capture the Flag

A Minecraft datapack that introduces fully functional Capture the Flag mechanics, extendable with function tag "hooks" and controllable via `/scoreboard` and `/trigger` interfaces.

## Documentation & Customization

This is not a full map or anything, it's just a datapack that allows you to add CtF to a map. In order to make it a full game, you'll have to use the datapack hooks to do some things:

- Create an interface that allows players to choose their teams and start the game via the commands listed blow (sign board/tellraw in chat/written book with clickEvents, etc.)
- Use the provided function hooks to keep score and end the game when appropriate
- Move players to and from the team selection/starting interface and the play area when the game starts/stops (likely via `/tp` commands, again using the function hooks listed below)

Game events can be triggered by setting scoreboard objectives on any player.

- To trigger the start of the game: `/scoreboard players set @r StartGame 1` or `/trigger StartGame set 1`
- To trigger the end of the game: `/scoreboard players set @r StopGame 1` or `/trigger StopGame set 1`

Players also use scoreboard triggers to set their team before the match.

- To trigger a team switch: `/trigger Joins[Team] set 1` where `[Team]` is `Red`, `Blue`, or `Specs` (spectators)
- To act on game events: Define the following function tags which are run at the time of each relevant event

There are also several function tags that are run at various points in the game. By adding functions of your own to these tags, you can customize what happens at various points in the game. The tags are:

- `geo1088.ctf:hooks/gamestart` (when the game starts)
- `geo1088.ctf:hooks/gamestop` (when the game stops)
- `geo1088.ctf:hooks/steal` (when a flag is stolen)
- `geo1088.ctf:hooks/capture` (when a flag is captured)
- `geo1088.ctf:hooks/return` (when a flag is returned)
- more to come uwu

There are some utility functions defined in the `.ctf:` namespace to save me time typing things. These may be removed at any time and are mostly utilities for debugging/world setup. When extending the game, do not rely on anything in the `.ctf:` namespace. Only use `geo1088.ctf:` things.

## Commands for setting up the world

Red team sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Join Red Team]\",\"color\":\"red\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsRed set 1\"}}"}

Blue team sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Join Blue Team]\",\"color\":\"blue\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsBlue set 1\"}}"}

Spectator sign:

    /data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\":\"[Spectate]\",\"color\":\"dark_gray\",\"underlined\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger JoinsSpec set 1\"}}"}

Start game sign:

	/data merge block ~ ~ ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Start Game]\",\"color\":\"dark_green\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\",\"value\":\"/trigger StartGame set 1\"}}"}

Stop game sign:

	/data merge block ~ ~1 ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Stop Game]\",\"color\":\"dark_purple\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\",\"value\":\"/trigger StopGame set 1\"}}"}

Developer stuffs sign:

	/data merge block ~ ~ ~ {Text2:"\"Right-click to\"",Text3:"{\"text\": \"[Enable Dev]\",\"color\":\"aqua\",\"underlined\":true,\"clickEvent\":{\"action\": \"run_command\", \"value\":\"execute as @p at @s run function .ctf:dev\"}}"}

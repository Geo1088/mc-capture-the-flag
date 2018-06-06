# TODO: move this to somewhere it runs repeatedly, you shouldn't have to F3+T to
#       get this message again

tellraw @a ""
tellraw @a "Capture the Flag by Geo1088 loaded."
tellraw @a ["Interested in contributing? ", {"text": "Code on GitHub!", "underlined": "true", "clickEvent": {"action": "open_url", "value": "https://github.com/Geo1088/mc-capture-the-flag"}}]
tellraw @a ""
tellraw @a [{"text": "[Join Red Team]", "underlined": true, "color": "red", "clickEvent": {"action": "run_command", "value": "/trigger JoinsRed set 1"}}, {"text": " - ", "color": "reset", "underlined": false}, {"text": "[Spectate]", "underlined": true, "color": "reset", "clickEvent": {"action": "run_command", "value": "/trigger JoinsSpec set 1"}}, {"text": " - ", "color": "reset", "underlined": false}, {"text": "[Join Blue Team]", "underlined": true, "color": "blue", "clickEvent": {"action": "run_command", "value": "/trigger JoinsBlue set 1"}}]
tellraw @a ""

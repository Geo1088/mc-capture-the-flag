tellraw @a "Capture the Flag loaded."
tellraw @a ""
tellraw @a ["Welcome to Capture the Flag by Geo1088!"]
tellraw @a [{"text": "[Join Red Team]", "underlined": true, "color": "red", "clickEvent": {"action": "run_command", "value": "/trigger JoinsRed set 1"}}, {"text": " - ", "color": "reset", "underlined": false}, {"text": "[Spectate]", "underlined": true, "color": "reset", "clickEvent": {"action": "run_command", "value": "/trigger JoinsSpec set 1"}}, {"text": " - ", "color": "reset", "underlined": false}, {"text": "[Join Blue Team]", "underlined": true, "color": "blue", "clickEvent": {"action": "run_command", "value": "/trigger JoinsBlue set 1"}}]
tellraw @a ""

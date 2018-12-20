# Objectives - Set up objectives used for the games.
# TODO: Delete and remake objectives on every load for portability(?)

# Objectives for players
scoreboard objectives add Health health "Health"
scoreboard objectives add IsDead deathCount "Player is dead?"

scoreboard objectives add CarryingRedFlag dummy "Has the red flag?"
scoreboard objectives add CarryingBlueFlag dummy "Has the blue flag?"
scoreboard objectives add StealsFlag dummy "Steals a flag this tick?"
scoreboard objectives add CapturesFlag dummy "Captures a flag this tick?"

# Trigger objectives for joining teams (enabled in main every tick)
scoreboard objectives add JoinsRed trigger "Joins the Red team this tick?"
scoreboard objectives add JoinsBlue trigger "Joins the Blue team this tick?"
scoreboard objectives add JoinsSpec trigger "Joins the spectators this tick?"

# Objectives for armor stands
scoreboard objectives add FlagPresent dummy "Flag present?"
scoreboard objectives add InGame dummy "In game?"
scoreboard objectives add StartGame trigger "Game starts this tick?"
scoreboard objectives add StopGame trigger "Game stops this tick?"

# Display
scoreboard objectives setdisplay list Health

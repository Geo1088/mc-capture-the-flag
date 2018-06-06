# Objectives - Set up objectives used for the games.
# TODO: Delete and remake objectives on every load for portability(?)

# Objectives for players
scoreboard objectives add Health health Health

scoreboard objectives add CarryingRedFlag dummy Has the red flag?
scoreboard objectives add CarryingBlueFlag dummy Has the blue flag?

scoreboard objectives add StealsFlag dummy Steals a flag this tick?
scoreboard objectives add ReplacesFlag dummy Replaces a flag this tick?
scoreboard objectives add CapturesFlag dummy Captures a flag this tick?

# Objectives for armor stands
scoreboard objectives add FlagPresent dummy Flag present?

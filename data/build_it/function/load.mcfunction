# Scoreboard for tracking numerical ids to identify players, projects,
# and individual building pieces
scoreboard objectives add EntityIds dummy

# Scoreboard for tracking what "selectable" components the player has selected
scoreboard objectives add PlayerSelectionTable dummy

# Scoreboard for tracking each player's current WIP project
scoreboard objectives add PlayerCreateProjectTable dummy

# Scoreboard to track which entites belong to what project "instance"
scoreboard objectives add ProjectPiecesTable dummy

# Table of commonly  used constants for optimization
scoreboard objectives add BuildItConstants dummy

function build_it:utility/init_global_constants

# Scoreboard for tracking which block displays correspond to what interaction entities
scoreboard objectives add BlockDisplays dummy

execute unless data storage build_it.saved_projects next_project_idx run data modify storage build_it.saved_projects next_project_idx set value 0
execute unless score NextId EntityIds matches 0..2147483647 run scoreboard players set NextId EntityIds 0
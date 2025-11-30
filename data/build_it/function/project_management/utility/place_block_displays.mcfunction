# Executed as Project Interaction

say "Placing Block Display"
# Current Project Already Loaded
data modify storage build_it.saved_projects current_project.current_block_display set from storage build_it.saved_projects current_project.block_displays[0]

execute at @s run summon minecraft:block_display ~ ~ ~ {Tags:["BuildIt_BlockDisplay","CurrentBlockDisplay"]}

scoreboard players operation @e[type=block_display, tag=CurrentBlockDisplay] ProjectPiecesTable = @e[type=minecraft:interaction, tag=CurrentProjectInteraction] EntityIds

data modify entity @e[type=minecraft:block_display, tag=CurrentBlockDisplay, limit=1] block_state set from storage build_it.saved_projects current_project.current_block_display.block_state
data modify entity @e[type=minecraft:block_display, tag=CurrentBlockDisplay, limit=1] Rotation set from storage build_it.saved_projects current_project.current_block_display.Rotation
data modify entity @e[type=minecraft:block_display, tag=CurrentBlockDisplay, limit=1] transformation.scale set from storage build_it.saved_projects current_project.current_block_display.scale

data modify storage build_it:temp_distance deltaX set from storage build_it.saved_projects current_project.current_block_display.DeltaPos[0]
data modify storage build_it:temp_distance deltaY set from storage build_it.saved_projects current_project.current_block_display.DeltaPos[1]
data modify storage build_it:temp_distance deltaZ set from storage build_it.saved_projects current_project.current_block_display.DeltaPos[2]

execute as @e[type=block_display,tag=CurrentBlockDisplay] run function build_it:block_displays/geometry/macro_relative_tp with storage build_it:temp_distance

data remove storage build_it.saved_projects current_project.current_block_display
data remove storage build_it.saved_projects current_project.block_displays[0]

execute as @e[type=minecraft:block_display, tag=CurrentBlockDisplay] run tag @s remove CurrentBlockDisplay

# Base Case : Execute if nbt entity is in list
execute if data storage build_it.saved_projects current_project.block_displays[0] run function build_it:project_management/utility/place_block_displays
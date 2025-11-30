# executed as player placing project
data modify storage build_it.saved_projects current_project set value {}

say "Placing Project..."

summon minecraft:interaction ~ ~ ~ {Tags:["BuildIt_ProjectInteraction", "PendingEntityId", "CurrentProjectInteraction", "BuildIt_PlacedProject"]}
execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id

$data modify storage build_it.saved_projects current_project set from storage build_it.saved_projects projects[$(project_idx)]

execute as @e[type=interaction, tag=CurrentProjectInteraction] run execute if data storage build_it.saved_projects current_project.block_displays[0] run function build_it:project_management/utility/place_block_displays

data remove storage build_it.saved_projects current_project

tag @s remove TargetPlayer
tag @e[type=minecraft:interaction, tag=CurrentProjectInteraction] remove CurrentProjectInteraction
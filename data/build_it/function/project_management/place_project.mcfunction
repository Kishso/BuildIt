# executed as player placing project
say "Placing Project..."

summon minecraft:marker ~ ~ ~ {Tags:[BuildIt_TempMarker]}

function build_it:utility/raycast_facing_block {step_size:0.05, max_distance:6}
execute if data storage build_it:functions {raycast:{result:{success:1b}}} run data modify entity @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] Pos set from storage build_it:functions raycast.result.last_air_pos 
execute if data storage build_it:functions {raycast:{result:{success:1b}}} as @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] at @s align xyz run tp @s ~0.5 ~ ~0.5

execute at @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] run summon minecraft:interaction ~ ~ ~ {Tags:["BuildIt_ProjectInteraction", "PendingEntityId", "CurrentProjectInteraction", "BuildIt_PlacedProject"]}
kill @e[type=minecraft:marker, tag=BuildIt_TempMarker]

execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id

data modify entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] data.current_project set from entity @s SelectedItem.components.minecraft:custom_data.project_data
data modify entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] data.project_data set from entity @s SelectedItem.components.minecraft:custom_data.project_data
data modify entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] data.placed_by set from entity @s UUID

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run function build_it:project_management/utility/place_item_displays

data remove entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] data.current_project


tag @e[type=minecraft:interaction, tag=CurrentProjectInteraction] remove CurrentProjectInteraction
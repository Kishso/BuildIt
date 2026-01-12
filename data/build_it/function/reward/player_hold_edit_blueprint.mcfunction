
execute if data entity @s equipment{offhand:{components:{"minecraft:item_model":"build_it:blueprint_edit"}}} run function build_it:project_management/highlight_project_interaction with entity @s equipment.offhand.components.minecraft:custom_data.project_interaction
execute if data entity @s SelectedItem{components:{"minecraft:item_model":"build_it:blueprint_edit"}} run function build_it:project_management/highlight_project_interaction with entity @s SelectedItem.components.minecraft:custom_data.project_interaction

execute if data entity @s equipment{offhand:{components:{"minecraft:item_model":"build_it:blueprint_edit"}}} run data modify entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] data.project_interaction set from entity @s equipment.offhand.components.minecraft:custom_data.project_interaction
execute if data entity @s SelectedItem{components:{"minecraft:item_model":"build_it:blueprint_edit"}} run data modify entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] data.project_interaction set from entity @s SelectedItem.components.minecraft:custom_data.project_interaction

execute unless entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, distance=..10] run schedule function build_it:reward/helper/remove_cursor 2s
execute unless entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, distance=..10] run summon minecraft:interaction ~ ~ ~ {Tags:[BuildIt_Cursor]}

function build_it:utility/raycast_facing_block {step_size:0.05, max_distance:6}
execute if data storage build_it:functions {raycast:{result:{success:1b}}} run data modify entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] Pos set from storage build_it:functions raycast.result.last_air_pos 
execute if data storage build_it:functions {raycast:{result:{success:1b}}} as @e[type=minecraft:interaction, tag=BuildIt_Cursor] at @s align xyz run tp @s ~0.5 ~ ~0.5

# Handle Cursor Display Entity
execute unless entity @e[type=minecraft:item_display, tag=BuildIt_Cursor, distance=..10] run summon minecraft:item_display ~ ~ ~ {Tags:[BuildIt_Cursor], item:{id:"minecraft:flint", components:{"minecraft:item_model":"build_it:cursor_item_display"}}}

execute at @e[type=minecraft:interaction, tag=BuildIt_Cursor,sort=nearest, limit=1] run tp @e[type=minecraft:item_display, tag=BuildIt_Cursor, sort=nearest, limit=1] ~ ~0.5 ~

execute if data entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] interaction run execute if data entity @s SelectedItem run function build_it:building/place_from_hand with entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1]
execute if data entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] interaction run data remove entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] interaction

execute if data entity @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1] attack run kill @e[type=minecraft:interaction, tag=BuildIt_Cursor, sort=nearest, limit=1]

advancement revoke @s only build_it:hold_edit_blueprint

summon minecraft:marker ~ ~ ~ {Tags:[BuildIt_TempMarker]}

function build_it:utility/raycast_facing_block {step_size:0.05, max_distance:6}
execute if data storage build_it:functions {raycast:{result:{success:1b}}} run data modify entity @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] Pos set from storage build_it:functions raycast.result.last_air_pos 
execute if data storage build_it:functions {raycast:{result:{success:1b}}} as @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] at @s align xyz run tp @s ~0.5 ~ ~0.5

execute at @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] run summon minecraft:interaction ~ ~ ~ {Tags:[BuildIt_Cursor,BeingPlaced]}

execute at @e[type=minecraft:marker, tag=BuildIt_TempMarker, limit=1, sort=nearest] run summon minecraft:item_display ~ ~0.5 ~ {Tags:[BeingPlaced], item:{id:"minecraft:flint", components:{"minecraft:item_model":"build_it:cursor_item_display"}}}

kill @e[type=minecraft:marker, tag=BuildIt_TempMarker]

data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.display_entity set from entity @e[type=minecraft:item_display, tag=BeingPlaced, limit=1] UUID
data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.target_project set from entity @s equipment.offhand.components.minecraft:custom_data.target_project
data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.target_player set from entity @s UUID

data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.cursor_type set value "item_display"
# Apply Spring Animation
data modify entity @e[type=minecraft:item_display, tag=BeingPlaced, limit=1] transformation.scale set value [0.9,0.9,0.9]
tag @e[type=minecraft:item_display, tag=BeingPlaced, limit=1] add BuildIt_CursorApplyAnimation
schedule function build_it:cursor/apply_animation 2t

execute as @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] run schedule function build_it:cursor/check 1t

execute as @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] run tag @s remove BeingPlaced
execute as @e[type=minecraft:item_display, tag=BeingPlaced, limit=1] run tag @s remove BeingPlaced
$execute as @p[nbt={UUID:$(target_player)}, limit=1] store result score @s build_it.building.pitch run data get entity @s Rotation[0] 1
$execute as @p[nbt={UUID:$(target_player)}, limit=1] store result score @s build_it.building.yaw run data get entity @s Rotation[1] 1

$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_x_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0]
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_y_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[1]
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_z_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[2]


$execute if score @s build_it.building.move_step matches 2 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.5 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta
$execute if score @s build_it.building.move_step matches 4 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.25 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta
$execute if score @s build_it.building.move_step matches 8 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.125 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta
$execute if score @s build_it.building.move_step matches 16 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.0625 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta
$execute if score @s build_it.building.move_step matches 32 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.03125 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta
$execute if score @s build_it.building.move_step matches 64 run execute store result storage build_it:functions calculate_new_translation.input2 float 0.015625 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta

function build_it:calculator/add with storage build_it:functions calculate_new_translation

$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_x_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0] set from storage build_it:calculator result
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_y_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[1] set from storage build_it:calculator result
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_z_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[2] set from storage build_it:calculator result

data remove storage build_it:functions calculate_new_translation

# Update Cursor
$tp @e[type=minecraft:interaction, nbt={UUID:$(target_cursor)}, limit=1] @e[nbt={UUID:$(target_display)}, limit=1]
$execute as @e[type=minecraft:interaction, nbt={UUID:$(target_cursor)}, limit=1] at @s run tp @s ~ ~-0.5 ~

$data modify storage build_it:functions distance_side set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0]
$data modify storage build_it:functions distance_up set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[1]
$data modify storage build_it:functions distance_forward set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[2]

$execute as @e[type=minecraft:interaction, nbt={UUID:$(target_cursor)}, limit=1] at @s rotated as @s run function build_it:utility/macro_vector_tp with storage build_it:functions

$tp @e[type=minecraft:item_display, nbt={UUID:$(cursor_display)}, limit=1] @e[type=minecraft:interaction, nbt={UUID:$(target_cursor)}, limit=1]
$execute as @e[type=minecraft:item_display, nbt={UUID:$(cursor_display)}, limit=1] at @s run tp @s ~ ~0.5 ~

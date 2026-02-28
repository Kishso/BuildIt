$execute as @p[nbt={UUID:$(target_player)}, limit=1] store result score @s build_it.building.pitch run data get entity @s Rotation[0] 1
$execute as @p[nbt={UUID:$(target_player)}, limit=1] store result score @s build_it.building.yaw run data get entity @s Rotation[1] 1

$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_x_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0]
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_y_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[1]
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_z_axis run data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[2]


$execute store result storage build_it:functions calculate_new_translation.input2 float 0.125 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta

function build_it:calculator/add with storage build_it:functions calculate_new_translation

$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_x_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0] set from storage build_it:calculator result
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_y_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[1] set from storage build_it:calculator result
$execute as @p[nbt={UUID:$(target_player)}, limit=1] if predicate build_it:building/build_z_axis run data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[2] set from storage build_it:calculator result

data remove storage build_it:functions calculate_new_translation
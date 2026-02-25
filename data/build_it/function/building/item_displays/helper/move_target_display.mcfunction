$data modify storage build_it:functions calculate_new_translation.input1 set from entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0]
$execute store result storage build_it:functions calculate_new_translation.input2 float 0.125 run scoreboard players get @p[nbt={UUID:$(target_player)}, limit=1] build_it.selected_slot_delta

function build_it:calculator/add with storage build_it:functions calculate_new_translation
$data modify entity @e[nbt={UUID:$(target_display)}, limit=1] transformation.translation[0] set from storage build_it:calculator result

#data remove storage build_it:functions calculate_new_translation
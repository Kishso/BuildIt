$execute unless score @s build_it.selected_slot matches 0.. run return run scoreboard players set @s build_it.selected_slot $(SelectedItemSlot)

$data modify storage build_it:functions calculate_delta_hotbar_slot.input1 set value $(SelectedItemSlot)
execute store result storage build_it:functions calculate_delta_hotbar_slot.input2 int 1 run scoreboard players get @s build_it.selected_slot

function build_it:calculator/subtract with storage build_it:functions calculate_delta_hotbar_slot
execute store result score @s build_it.selected_slot_delta run data get storage build_it:calculator result 1

# Wrap around detection
execute if score @s build_it.selected_slot_delta matches 8 run scoreboard players set @s build_it.selected_slot_delta -1
execute if score @s build_it.selected_slot_delta matches 7 run scoreboard players set @s build_it.selected_slot_delta -2
execute if score @s build_it.selected_slot_delta matches -8 run scoreboard players set @s build_it.selected_slot_delta 1
execute if score @s build_it.selected_slot_delta matches -7 run scoreboard players set @s build_it.selected_slot_delta 2

$scoreboard players set @s build_it.selected_slot $(SelectedItemSlot)
data remove storage build_it:functions calculate_delta_hotbar_slot

execute if score @s build_it.selected_slot_delta matches 0 run return fail

say change detected 

data modify storage build_it:functions move_display.cursor_uuid set value [I;0,0,0,0]
execute store result storage build_it:functions move_display.cursor_uuid[0] int 1 run scoreboard players get @s build_it.cursor.selected_uuid1
execute store result storage build_it:functions move_display.cursor_uuid[1] int 1 run scoreboard players get @s build_it.cursor.selected_uuid2
execute store result storage build_it:functions move_display.cursor_uuid[2] int 1 run scoreboard players get @s build_it.cursor.selected_uuid3
execute store result storage build_it:functions move_display.cursor_uuid[3] int 1 run scoreboard players get @s build_it.cursor.selected_uuid4

data modify storage build_it:functions move_display.target_player set from entity @s UUID
function build_it:building/item_displays/helper/move_from_cursor with storage build_it:functions move_display

#data remove storage build_it:functions move_display
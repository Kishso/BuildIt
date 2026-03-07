scoreboard players reset @s build_it.trigger.edit_move

scoreboard players reset @s build_it.selected_slot
scoreboard players reset @s build_it.selected_slot_delta

data modify storage build_it:functions exit_display.cursor_uuid set value [I;0,0,0,0]
execute store result storage build_it:functions exit_display.cursor_uuid[0] int 1 run scoreboard players get @s build_it.cursor.selected_uuid1
execute store result storage build_it:functions exit_display.cursor_uuid[1] int 1 run scoreboard players get @s build_it.cursor.selected_uuid2
execute store result storage build_it:functions exit_display.cursor_uuid[2] int 1 run scoreboard players get @s build_it.cursor.selected_uuid3
execute store result storage build_it:functions exit_display.cursor_uuid[3] int 1 run scoreboard players get @s build_it.cursor.selected_uuid4 

function build_it:cursor/edit_mode/move/reset_model_wrapper with storage build_it:functions exit_display

data remove storage build_it:functions exit_display

scoreboard players reset @s build_it.cursor.selected_uuid1
scoreboard players reset @s build_it.cursor.selected_uuid2
scoreboard players reset @s build_it.cursor.selected_uuid3
scoreboard players reset @s build_it.cursor.selected_uuid3


say remove cursor
execute if score @s build_it.cursor.cursor_mode matches 0 run function build_it:cursor/place_mode/exit
execute if score @s build_it.cursor.cursor_mode matches 1 run function build_it:cursor/edit_mode/exit

advancement revoke @s only build_it:hold_edit_blueprint
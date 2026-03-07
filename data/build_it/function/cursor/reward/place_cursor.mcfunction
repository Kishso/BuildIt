
execute unless score @s build_it.cursor.cursor_mode matches 0..1 run scoreboard players set @s build_it.cursor.cursor_mode 0

execute if score @s build_it.cursor.cursor_mode matches 0 run function build_it:cursor/place_mode/enter
execute if score @s build_it.cursor.cursor_mode matches 1 run function build_it:cursor/edit_mode/enter

schedule function build_it:cursor/check_cursor 1t
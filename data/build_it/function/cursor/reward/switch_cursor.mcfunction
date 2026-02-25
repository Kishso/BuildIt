advancement revoke @s only build_it:cursor/shift_with_blueprint_active

execute if score @s build_it.cursor.sneak_cooldown matches 1.. run return fail

scoreboard players set @s build_it.cursor.sneak_cooldown 20
schedule function build_it:cursor/utility/reset_shift_cooldown 1t

execute if score @s build_it.trigger.edit_move matches 0.. run return run scoreboard players reset @s build_it.trigger.edit_move

function build_it:cursor/switch_cursor_mode


function build_it:cursor/editable/place_move_cursor with entity @s

scoreboard players enable @s build_it.edit_dialog_open
trigger build_it.edit_dialog_open set 1

function build_it:building/check_triggers with entity @s

scoreboard players enable @s build_it.edit_dialog_open
dialog show @s build_it:move_display

advancement revoke @s only build_it:select_editable
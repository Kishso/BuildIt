advancement revoke @s only build_it:cursor/left_click_edit_cursor

scoreboard players enable @s build_it.trigger.move_settings

dialog show @s build_it:building/move_settings 

schedule function build_it:building/triggers/check_move_settings 1t

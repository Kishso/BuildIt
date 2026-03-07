execute as @p[scores={build_it.trigger.move_settings=1..}] run function build_it:building/settings/parse_move_settings

execute if entity @p[scores={build_it.trigger.move_settings=0}] run return run schedule function build_it:building/triggers/check_move_settings 1t

execute as @p run scoreboard players reset @s build_it.trigger.move_settings
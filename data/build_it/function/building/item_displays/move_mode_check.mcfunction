
execute as @p[scores={build_it.trigger.edit_move=0..}] run function build_it:building/item_displays/move with entity @s

execute if entity @p[scores={build_it.trigger.edit_move=0..}] run schedule function build_it:building/item_displays/move_mode_check 1t
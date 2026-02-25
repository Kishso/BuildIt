advancement revoke @s only build_it:cursor/right_click_edit_cursor

execute if predicate build_it:player_holding_move_hammer run scoreboard players enable @s build_it.trigger.edit_move
execute if predicate build_it:player_holding_move_hammer run trigger build_it.trigger.edit_move set 0
execute if predicate build_it:player_holding_move_hammer run schedule function build_it:building/item_displays/move_mode_check 1t

function build_it:cursor/reward/utility/store_cursor_uuid with entity @s
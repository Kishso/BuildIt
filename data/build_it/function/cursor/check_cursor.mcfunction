execute as @e[type=minecraft:interaction, tag=BuildIt_Cursor] run function build_it:cursor/utility/check_player_valid with entity @s data

execute if entity @e[type=minecraft:interaction, tag=BuildIt_Cursor] run schedule function build_it:cursor/check_cursor 1t
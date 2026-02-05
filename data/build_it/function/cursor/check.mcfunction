
execute as @e[type=minecraft:interaction, tag=BuildIt_Cursor] run function build_it:cursor/attempt_remove with entity @s data

execute as @e[type=minecraft:interaction, tag=BuildIt_Cursor] run function build_it:cursor/attempt_move with entity @s data

execute as @e[type=minecraft:interaction, tag=BuildIt_Cursor] run function build_it:cursor/attempt_place with entity @s data

execute if entity @e[type=minecraft:interaction, tag=BuildIt_Cursor] run schedule function build_it:cursor/check 1t
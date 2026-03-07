execute unless score @s build_it.cursor.cursor_mode matches 0 run return fail

execute as @e[type=minecraft:interaction, tag=BuildIt_PlaceCursor] run function build_it:cursor/attempt_remove with entity @s data

execute as @e[type=minecraft:interaction, tag=BuildIt_PlaceCursor] run function build_it:cursor/attempt_move with entity @s data

execute as @e[type=minecraft:interaction, tag=BuildIt_PlaceCursor] run function build_it:cursor/attempt_place with entity @s data

execute if entity @e[type=minecraft:interaction, tag=BuildIt_PlaceCursor] run schedule function build_it:cursor/place_mode/update 1t
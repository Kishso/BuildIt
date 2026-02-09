execute as @e[type=minecraft:item_display, tag=BuildIt_Edit, distance=0..10] run function build_it:cursor/edit/place with entity @s
execute as @e[type=minecraft:block_display, tag=BuildIt_Edit, distance=0..10] run function build_it:cursor/edit/place with entity @s
execute as @e[type=minecraft:interaction, tag=BuildIt_Edit, distance=0..10] run function build_it:cursor/edit/place with entity @s

execute if entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor] run schedule function build_it:cursor/edit/cleanup_edit_interactions 5s
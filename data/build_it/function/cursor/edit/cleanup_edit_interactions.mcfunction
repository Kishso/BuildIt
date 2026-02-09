execute as @e[type=minecraft:interaction, tag=BuildIt_EditCursor] at @s unless entity @p[distance=..10] run kill @s

execute if entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor] run schedule function build_it:cursor/edit/cleanup_edit_interactions 5s
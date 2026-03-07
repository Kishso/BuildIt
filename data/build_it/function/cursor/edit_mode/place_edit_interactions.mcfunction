data modify storage build_it:functions place_edit_interactions.target_player set from entity @s UUID
$execute as @e[type=minecraft:item_display, tag=BuildIt_Edit, nbt={data:{target_project:$(target_project)}}] run function build_it:cursor/edit_mode/place with entity @s
$execute as @e[type=minecraft:block_display, tag=BuildIt_Edit, nbt={data:{target_project:$(target_project)}}] run function build_it:cursor/edit_mode/place with entity @s
$execute as @e[type=minecraft:interaction, tag=BuildIt_Edit, nbt={data:{target_project:$(target_project)}}] run function build_it:cursor/edit_mode/place with entity @s
data remove storage build_it:functions place_edit_interactions
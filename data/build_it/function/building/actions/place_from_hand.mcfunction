$execute unless entity @e[type=minecraft:interaction, nbt={UUID:$(target_project)}] run return run say "Error: Can't find project!"
$execute as @p[nbt={UUID:$(target_player)}] unless predicate build_it:player_holding_action run return run say "Player is not holding an action slip!"

# Place an interaction
execute at @s run summon minecraft:interaction ~ ~ ~ {Tags:["BeingPlaced", "BuildIt_Edit", "BuildIt_Action"]}
$data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.action set from entity @p[nbt={UUID:$(target_player)}] SelectedItem.components.minecraft:custom_data.build_it:action
$data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, limit=1] data.target_project set value $(target_project)

execute as @e[type=minecraft:interaction, tag=BeingPlaced] run tag @s remove BeingPlaced
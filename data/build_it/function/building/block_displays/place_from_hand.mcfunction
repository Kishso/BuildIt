# Place What is Currently in Players Hand, executed with Place It Cursor

# Check if project interaction still exists
$execute unless entity @e[type=minecraft:interaction, nbt={UUID:$(target_project)}] run return run say "Error: Can't find project!"
$execute unless data entity @p[nbt={UUID:$(target_player)}] SelectedItem run return run say "Error: Player is holding nothing!"

# Do Just Block Display, add item displays and interactions later
execute at @s run summon minecraft:block_display ~-0.5 ~ ~-0.5 {Tags:["BeingPlaced", "BuildIt_Editable"]}
$data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] block_state.Name set from entity @p[nbt={UUID:$(target_player)}] SelectedItem.id
$data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] data.target_project set value $(target_project)

# Calculate relative distance
$tag @e[type=minecraft:interaction,nbt={UUID:$(target_project)}] add CurrentOriginEntity
execute as @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] run function build_it:utility/calculate_local_vector
$tag @e[type=minecraft:interaction,nbt={UUID:$(target_project)}] remove CurrentOriginEntity

data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] transformation.translation[0] set from storage build_it:vector result.distance_side
data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] transformation.translation[1] set from storage build_it:vector result.distance_up
data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] transformation.translation[2] set from storage build_it:vector result.distance_forward

$tp @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] @e[type=minecraft:interaction, nbt={UUID:$(target_project)}, limit=1]

execute as @e[type=minecraft:block_display, tag=BeingPlaced] run tag @s remove BeingPlaced
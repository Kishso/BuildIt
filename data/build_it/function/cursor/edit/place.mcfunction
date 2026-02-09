$execute if entity @s[nbt={data:{cursor_display:$(UUID)}}] run return fail

say placing new interaction
execute at @s run summon minecraft:interaction ~ ~-0.5 ~ {Tags:[BuildIt_EditCursor, BeingPlaced]}

data modify storage build_it:functions distance_side set from entity @s transformation.translation[0]
data modify storage build_it:functions distance_up set from entity @s transformation.translation[1]
data modify storage build_it:functions distance_forward set from entity @s transformation.translation[2]

execute as @e[type=minecraft:interaction, tag=BeingPlaced] at @s rotated as @s run function build_it:utility/macro_vector_tp with storage build_it:functions
data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, sort=nearest, limit=1] data.target_entity set from entity @s UUID

execute as @e[type=minecraft:interaction, tag=BeingPlaced] run tag @s remove BeingPlaced

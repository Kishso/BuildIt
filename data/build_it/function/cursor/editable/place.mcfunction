say edit/place

$execute if entity @e[nbt={data:{target_display:$(UUID)}}] run return fail

say placing new interaction
summon minecraft:interaction ~ ~-0.5 ~ {Tags:[BuildIt_EditCursor, BeingPlaced]}
data modify entity @e[type=minecraft:interaction, tag=BeingPlaced, sort=nearest, limit=1] data.target_display set from entity @s UUID

execute as @e[type=minecraft:interaction, tag=BeingPlaced] run tag @s remove BeingPlaced

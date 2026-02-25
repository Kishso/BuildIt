execute at @s rotated as @s run summon minecraft:marker ~ ~-0.5 ~ {Tags:["PosMarkerTemp"]}

data modify storage build_it:functions teleport_marker.distance_side set from entity @s transformation.translation[0]
data modify storage build_it:functions teleport_marker.distance_up set from entity @s transformation.translation[1]
data modify storage build_it:functions teleport_marker.distance_forward set from entity @s transformation.translation[2]

execute as @e[tag=PosMarkerTemp, limit=1] at @s run function build_it:utility/macro_vector_tp with storage build_it:functions teleport_marker
data remove storage build_it:functions teleport_marker

$execute as @e[tag=PosMarkerTemp, limit=1] at @s if entity @e[nbt={UUID:$(UUID)}, distance=..1] run data remove storage build_it:functions raycast.inProgress
$execute as @e[tag=PosMarkerTemp, limit=1] at @s if entity @e[nbt={UUID:$(UUID)}, distance=..1] run data modify storage build_it:functions raycast.result.target_entity set from entity @e[nbt={UUID:$(UUID)}, distance=..1, sort=nearest ,limit=1] UUID
$execute as @e[tag=PosMarkerTemp, limit=1] at @s if entity @e[nbt={UUID:$(UUID)}, distance=..1] run data modify storage build_it:functions raycast.result.success set value true

kill @e[tag=PosMarkerTemp]
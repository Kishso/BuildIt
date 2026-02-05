execute at @s run summon minecraft:marker ~ ~ ~ {Tags:[BuildIt_TempMarker]}

$execute as @p[nbt={UUID:$(target_player)}] at @s rotated as @s run function build_it:utility/raycast_facing_block {step_size:0.05, max_distance:6}
execute if data storage build_it:functions {raycast:{result:{success:1b}}} run data modify entity @s Pos set from storage build_it:functions raycast.result.last_air_pos 
execute if data storage build_it:functions {raycast:{result:{success:1b}}} at @s align xyz run tp @s ~0.5 ~ ~0.5

execute at @s if entity @e[type=minecraft:marker, tag=BuildIt_TempMarker, distance=0..0.1] run return run kill @e[type=minecraft:marker, tag=BuildIt_TempMarker]

$data modify entity @e[type=minecraft:item_display, nbt={UUID:$(display_entity)}, limit=1] transformation.scale set value [0.9,0.9,0.9]
$execute at @s run tp @e[type=minecraft:item_display, nbt={UUID:$(display_entity)}] @s
$execute as @e[type=minecraft:item_display, nbt={UUID:$(display_entity)}] at @s run tp @s ~0 ~0.5 ~0

$tag @e[type=minecraft:item_display, nbt={UUID:$(display_entity)}, limit=1] add BuildIt_CursorApplyAnimation
schedule function build_it:cursor/apply_animation 2t

kill @e[type=minecraft:marker, tag=BuildIt_TempMarker]
# Executed as Target Block Display
scoreboard objectives add sf_GetDisplayCenter dummy

execute store result score walk_x sf_GetDisplayCenter run data get entity @s transformation.scale[0] 1000
execute store result score walk_y sf_GetDisplayCenter run data get entity @s transformation.scale[1] 1000
execute store result score walk_z sf_GetDisplayCenter run data get entity @s transformation.scale[2] 1000

scoreboard players operation walk_x sf_GetDisplayCenter /= Two BuildItConstants
scoreboard players operation walk_y sf_GetDisplayCenter /= Two BuildItConstants
scoreboard players operation walk_z sf_GetDisplayCenter /= Two BuildItConstants

$execute as @s at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true, Invisible:true , Tags:["$(result_tag)","CurrentArmorStand"]}

execute store result entity @e[type=minecraft:armor_stand, tag=CurrentArmorStand, limit=1] Rotation[0] float 1.0 run data get entity @s Rotation[0] 1.0
execute store result entity @e[type=minecraft:armor_stand, tag=CurrentArmorStand, limit=1] Rotation[1] float 1.0 run data get entity @s Rotation[1] 1.0

# armour stand walks forward z distance
execute store result storage build_it:temp_distance distance_side float 0.001 run scoreboard players get walk_x sf_GetDisplayCenter
execute store result storage build_it:temp_distance distance_up float 0.001 run scoreboard players get walk_y sf_GetDisplayCenter
execute store result storage build_it:temp_distance distance_forward float 0.001 run scoreboard players get walk_z sf_GetDisplayCenter

execute as @e[type=minecraft:armor_stand, tag=CurrentArmorStand] rotated as @s at @s run function build_it:block_displays/geometry/macro_vector_tp with storage build_it:temp_distance

tag @e[type=minecraft:armor_stand, tag=CurrentArmorStand] remove CurrentArmorStand
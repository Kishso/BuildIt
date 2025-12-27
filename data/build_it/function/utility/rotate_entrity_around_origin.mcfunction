# Executed as entity getting rotated
# Origin Entity tagged as CurrentOriginEntity
# Rotation stored in Macros

$data modify storage build_it:rotate_project deltaYaw set value $(deltaYaw) 
$data modify storage build_it:rotate_project deltaPitch set value $(deltaPitch) 

execute at @e[tag=CurrentOriginEntity, sort=nearest, limit=1] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true, Invisible:true, Tags:["TempArmorStand"]}
execute as @s at @s run function build_it:utility/calculate_local_vector

# Rotate Armor Stand
execute as @e[type=minecraft:armor_stand, tag=TempArmorStand] run function build_it:block_displays/geometry/macro_relative_rotate with storage build_it:rotate_project

execute as @s at @e[type=minecraft:armor_stand, tag=TempArmorStand] rotated as @e[type=minecraft:armor_stand, tag=TempArmorStand] run function build_it:block_displays/geometry/macro_vector_tp with storage build_it:temp_distance

# Rotate Entity Itself
execute as @s at @s run function build_it:block_displays/geometry/macro_relative_rotate with storage build_it:rotate_project


kill @e[type=minecraft:armor_stand, tag=TempArmorStand]
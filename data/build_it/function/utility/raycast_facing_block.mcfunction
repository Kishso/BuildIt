# Performs a raycast from an entity to get the block the entity is looking at.
# Stores both the position of block found, and one prior

# Requires raycast.step_size, raycast.max_distance
# Returns raycast.result.succeded
# If success, returns raycast.result.target_pos and raycast.result.last_air_pos, both being an nbt collection of {x,y,z} coordinates

$data modify storage build_it:functions raycast.step_size set value $(step_size)
$data modify storage build_it:functions raycast.max_distance set value $(max_distance)

execute unless entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand] run data modify storage build_it:functions raycast.inProgress set value true
execute unless entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand] at @s anchored eyes run summon minecraft:armor_stand ^ ^ ^ {NoGravity:true, Tags:["BuildIt_RaycastStand"]}
data modify entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] Rotation set from entity @s Rotation



# Check for end condition
execute as @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data modify storage build_it:functions raycast.result.target_pos set from entity @s Pos
execute as @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data remove storage build_it:functions raycast.inProgress
execute as @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data modify storage build_it:functions raycast.result.success set value true

# Check if max distance reached
$execute unless entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, distance=..$(max_distance)] run data remove storage build_it:functions raycast.inProgress
$execute unless entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, distance=..$(max_distance)] run data modify storage build_it:functions raycast.result.success set value false

# Move Enity and perform recursion
execute if data storage build_it:functions raycast.inProgress run data modify storage build_it:functions raycast.result.last_air_pos set from entity @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] Pos
$execute if data storage build_it:functions raycast.inProgress as @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1] at @s rotated as @s run tp @s ^ ^ ^$(step_size)
execute if data storage build_it:functions raycast.inProgress run function build_it:utility/raycast_facing_block with storage build_it:functions raycast

execute unless data storage build_it:functions raycast.inProgress run kill @e[type=minecraft:armor_stand, tag=BuildIt_RaycastStand, sort=nearest, limit=1]
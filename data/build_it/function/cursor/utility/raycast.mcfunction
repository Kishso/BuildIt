# Performs a raycast from an entity to get the block the entity is looking at.
# Stores both the position of block found, and one prior

# Requires raycast.step_size, raycast.max_distance
# Returns raycast.result.succeded
# If success, returns raycast.result.target_pos and raycast.result.last_air_pos, both being an nbt collection of {x,y,z} coordinates

$data modify storage build_it:functions raycast.step_size set value $(step_size)
$data modify storage build_it:functions raycast.max_distance set value $(max_distance)

execute unless entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker] run data modify storage build_it:functions raycast.inProgress set value true
execute unless entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {NoGravity:true, Tags:["BuildIt_RaycastMarker"]}
data modify entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] Rotation set from entity @s Rotation

# Check for end condition via Block
# execute as @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run say Found Block
execute as @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data modify storage build_it:functions raycast.result.target_pos set from entity @s Pos
execute as @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data remove storage build_it:functions raycast.inProgress
execute as @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] at @s rotated as @s unless block ~ ~ ~ #build_it:cursor_placeable run data modify storage build_it:functions raycast.result.success set value true


# Check if max distance reached
$execute unless entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, distance=..$(max_distance)] run data remove storage build_it:functions raycast.inProgress
$execute unless entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, distance=..$(max_distance)] run data modify storage build_it:functions raycast.result.success set value false

# Move Enity and perform recursion
execute if data storage build_it:functions raycast.inProgress run data modify storage build_it:functions raycast.result.last_air_pos set from entity @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] Pos
$execute if data storage build_it:functions raycast.inProgress as @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] at @s rotated as @s run tp @s ^ ^ ^$(step_size)
execute if data storage build_it:functions raycast.inProgress run function build_it:cursor/utility/raycast with storage build_it:functions raycast

execute unless data storage build_it:functions raycast.inProgress run kill @e[type=minecraft:marker, tag=BuildIt_RaycastMarker, sort=nearest, limit=1] 
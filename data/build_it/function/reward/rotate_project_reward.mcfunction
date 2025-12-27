# Gets executed as player
scoreboard objectives add sf_RotateProjectReward dummy

say "Rotating Project"

execute as @e[type=minecraft:interaction,tag=BuildIt_PlacedProject] if data entity @s attack run tag @s add CurrentProjectInteraction
execute as @e[type=minecraft:interaction,tag=CurrentProjectInteraction] if data entity @s attack run data remove entity @s attack

data modify storage build_it:functions rotate_project.deltaYaw set value 0
data modify storage build_it:functions rotate_project.deltaPitch set value 0

data modify storage build_it:functions rotate_project.stepRotate set value 15

execute if predicate build_it:player_sneaking run data modify storage build_it:calculator input1 set from storage build_it:functions.rotate_project stepRotate
execute if predicate build_it:player_sneaking run data modify storage build_it:calculator input2 set value -1

execute if predicate build_it:player_sneaking run function build_it:calculator/multiply with storage build_it:calculator
execute if predicate build_it:player_sneaking run data modify storage build_it:functions.rotate_project stepRotate set from storage build_it:calculator result

# Rotate Horizontal
execute if entity @s[x_rotation=-45..45] run data modify storage build_it:functions.rotate_project deltaYaw set from storage build_it:functions.rotate_project stepRotate

# Rotate Vertical
execute if entity @s[x_rotation=45..-45] run data modify storage build_it:functions.rotate_project deltaPitch set from storage build_it:functions.rotate_project stepRotate

# Rotate Project Pieces around project origin
tag @e[type=minecraft:interaction, tag=CurrentProjectInteraction] add CurrentOriginEntity
execute as @e[type=minecraft:block_display] at @s if score @s ProjectPiecesTable = @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] EntityIds run function build_it:utility/rotate_entrity_around_origin with storage build_it:functions.rotate_project
tag @e[type=minecraft:interaction, tag=CurrentOriginEntity] remove CurrentOriginEntity
 
# Rotate Origin Itself
execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run function build_it:block_displays/geometry/macro_relative_rotate with storage build_it:functions.rotate_project

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run tag @s remove CurrentProjectInteraction
scoreboard objectives remove sf_RotateProjectReward

advancement revoke @s only build_it:rotate_project

data remove storage build_it:functions rotate_project
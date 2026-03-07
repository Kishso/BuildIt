# Gets executed as player
scoreboard objectives add sf_MoveProjectReward dummy

execute as @e[type=minecraft:interaction,tag=BuildIt_PlacedProject] if data entity @s attack run tag @s add CurrentProjectInteraction
execute as @e[type=minecraft:interaction,tag=CurrentProjectInteraction] if data entity @s attack run data remove entity @s attack

data modify storage build_it:temp_distance deltaX set value 0
data modify storage build_it:temp_distance deltaY set value 0
data modify storage build_it:temp_distance deltaZ set value 0

scoreboard players set StepSize sf_MoveProjectReward 100

execute if predicate build_it:player_sneaking run scoreboard players operation StepSize sf_MoveProjectReward *= NegOne BuildItConstants

execute if entity @s[y_rotation=45..135, x_rotation=-45..45] run scoreboard players operation StepSize sf_MoveProjectReward *= NegOne BuildItConstants
execute if entity @s[y_rotation=135..-135, x_rotation=-45..45] run execute run scoreboard players operation StepSize sf_MoveProjectReward *= NegOne BuildItConstants
execute if entity @s[x_rotation=45..90] run scoreboard players operation StepSize sf_MoveProjectReward *= NegOne BuildItConstants

execute if entity @s[y_rotation=135..-135, x_rotation=-45..45] run execute store result storage build_it:temp_distance deltaZ double 0.001 run scoreboard players get StepSize sf_MoveProjectReward
execute if entity @s[y_rotation=-45..45, x_rotation=-45..45] run execute store result storage build_it:temp_distance deltaZ double 0.001 run scoreboard players get StepSize sf_MoveProjectReward

execute if entity @s[y_rotation=-135..-45, x_rotation=-45..45] run execute store result storage build_it:temp_distance deltaX double 0.001 run scoreboard players get StepSize sf_MoveProjectReward
execute if entity @s[y_rotation=45..135, x_rotation=-45..45] run execute store result storage build_it:temp_distance deltaX double 0.001 run scoreboard players get StepSize sf_MoveProjectReward

execute if entity @s[x_rotation=-90..-45] run execute store result storage build_it:temp_distance deltaY double 0.001 run scoreboard players get StepSize sf_MoveProjectReward
execute if entity @s[x_rotation=45..90] run execute store result storage build_it:temp_distance deltaY double 0.001 run scoreboard players get StepSize sf_MoveProjectReward

execute as @e[type=minecraft:block_display] at @s if score @s ProjectPiecesTable = @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] EntityIds run function build_it:block_displays/geometry/macro_relative_tp with storage build_it:temp_distance
execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] at @s run function build_it:block_displays/geometry/macro_relative_tp with storage build_it:temp_distance

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run tag @s remove CurrentProjectInteraction
scoreboard objectives remove sf_MoveProjectReward

advancement revoke @s only build_it:move_project
# Executed as BlockDisplayInteraction
scoreboard objectives add sf_SaveBlockDisplay dummy

execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run tag @s add CurrentTargetInteractionEntity
execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

data modify storage build_it:saved_projects current_project.current_block_display set value {}

data modify storage build_it:saved_projects current_project.current_block_display.rotation set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] Rotation
data modify storage build_it:saved_projects current_project.current_block_display.scale set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] transformation.scale
data modify storage build_it:saved_projects current_project.current_block_display.block_state set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] block_state

execute as @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] at @s run function build_it:utility/calculate_local_vector
data modify storage build_it:saved_projects current_project.current_block_display.displacement set from storage build_it:vector result

data modify storage build_it:saved_projects current_project.block_displays append from storage build_it:saved_projects current_project.current_block_display

data remove storage build_it:saved_projects current_project.current_block_display

tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity
tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity

scoreboard objectives remove sf_SaveBlockDisplay
# Executed as BlockDisplayInteraction
scoreboard objectives add sf_SaveBlockDisplay dummy

say "Saving Block Display"

execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run tag @s add CurrentTargetInteractionEntity
execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

data modify storage build_it.saved_projects current_project.current_block_display set value {}

data modify storage build_it.saved_projects current_project.current_block_display.Rotation set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] Rotation
data modify storage build_it.saved_projects current_project.current_block_display.scale set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] transformation.scale
data modify storage build_it.saved_projects current_project.current_block_display.block_state set from entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] block_state

execute store result score ProjectX sf_SaveBlockDisplay run data get entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] Pos[0] 1000
execute store result score ProjectY sf_SaveBlockDisplay run data get entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] Pos[1] 1000
execute store result score ProjectZ sf_SaveBlockDisplay run data get entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] Pos[2] 1000

execute store result score DisplayX sf_SaveBlockDisplay run data get entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] Pos[0] 1000
execute store result score DisplayY sf_SaveBlockDisplay run data get entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] Pos[1] 1000
execute store result score DisplayZ sf_SaveBlockDisplay run data get entity @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity, limit=1] Pos[2] 1000

scoreboard players operation DisplayX sf_SaveBlockDisplay -= ProjectX sf_SaveBlockDisplay
scoreboard players operation DisplayY sf_SaveBlockDisplay -= ProjectY sf_SaveBlockDisplay
scoreboard players operation DisplayZ sf_SaveBlockDisplay -= ProjectZ sf_SaveBlockDisplay

data modify storage build_it.saved_projects current_project.current_block_display.DeltaPos append value 0.0d
data modify storage build_it.saved_projects current_project.current_block_display.DeltaPos append value 0.0d
data modify storage build_it.saved_projects current_project.current_block_display.DeltaPos append value 0.0d

execute store result storage build_it.saved_projects current_project.current_block_display.DeltaPos[0] double 0.001 run scoreboard players get DisplayX sf_SaveBlockDisplay
execute store result storage build_it.saved_projects current_project.current_block_display.DeltaPos[1] double 0.001 run scoreboard players get DisplayY sf_SaveBlockDisplay
execute store result storage build_it.saved_projects current_project.current_block_display.DeltaPos[2] double 0.001 run scoreboard players get DisplayZ sf_SaveBlockDisplay

data modify storage build_it.saved_projects current_project.block_displays append from storage build_it.saved_projects current_project.current_block_display

data remove storage build_it.saved_projects current_project.current_block_display

tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity
tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity

scoreboard objectives remove sf_SaveBlockDisplay
scoreboard objectives add sf_FitInteraction dummy

execute store result score XScale sf_FitInteraction run data get entity @e[tag=CurrentTargetDisplayEntity, limit=1] transformation.scale[0] 1000
execute store result score YScale sf_FitInteraction run data get entity @e[tag=CurrentTargetDisplayEntity, limit=1] transformation.scale[1] 1000
execute store result score ZScale sf_FitInteraction run data get entity @e[tag=CurrentTargetDisplayEntity, limit=1] transformation.scale[2] 1000

# Change Interaction Size
execute store result entity @e[tag=CurrentTargetInteractionEntity, limit=1] height double 0.001 run scoreboard players get YScale sf_FitInteraction

execute if score XScale sf_FitInteraction >= ZScale sf_FitInteraction run execute store result entity @e[tag=CurrentTargetInteractionEntity, limit=1] width double 0.001 run scoreboard players get XScale sf_FitInteraction
execute unless score XScale sf_FitInteraction >= ZScale sf_FitInteraction run execute store result entity @e[tag=CurrentTargetInteractionEntity, limit=1] width double 0.001 run scoreboard players get ZScale sf_FitInteraction

### Change Interaction Location

execute as @e[type=block_display, tag=CurrentTargetDisplayEntity] run function build_it:block_displays/geometry/get_display_center {result_tag:CurrentDisplayCenter}
tp @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity] @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter, limit=1]

# Adjust for Height (Half YScale)
execute store result storage build_it:temp_distance deltaX float 0.001 run scoreboard players get Zero BuildItConstants
execute store result storage build_it:temp_distance deltaY float -0.0005 run scoreboard players get YScale sf_FitInteraction
execute store result storage build_it:temp_distance deltaZ float 0.001 run scoreboard players get Zero BuildItConstants

execute as @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity] rotated as @s at @s run function build_it:block_displays/geometry/macro_relative_tp with storage build_it:temp_distance

kill @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter]
scoreboard objectives remove sf_FitInteraction
scoreboard objectives add sf_BlockDisplayResize dummy

execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run tag @s add CurrentTargetInteractionEntity
execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

$execute store result score ScaleVal sf_BlockDisplayResize run data get entity @e[tag=CurrentTargetDisplayEntity, limit=1] transformation.scale[$(scale_index)] 1000
scoreboard players operation ScaleVal sf_BlockDisplayResize += @s StepSize_Scale
$execute store result entity @e[tag=CurrentTargetDisplayEntity, limit=1] transformation.scale[$(scale_index)] double 0.001 run scoreboard players get ScaleVal sf_BlockDisplayResize

scoreboard players operation Nudge sf_BlockDisplayResize = @s StepSize_Scale
scoreboard players set NegTwo sf_BlockDisplayResize -2
scoreboard players operation Nudge sf_BlockDisplayResize /= NegTwo sf_BlockDisplayResize

$execute store result score PosVal sf_BlockDisplayResize run data get entity @e[tag=CurrentTargetDisplayEntity, limit=1] Pos[$(scale_index)] 1000
scoreboard players operation PosVal sf_BlockDisplayResize += Nudge sf_BlockDisplayResize
$execute store result entity @e[tag=CurrentTargetDisplayEntity, limit=1] Pos[$(scale_index)] double 0.001 run scoreboard players get PosVal sf_BlockDisplayResize

execute if entity @s[tag=BuildIt_BlockDisplayInteraction] run function build_it:block_displays/geometry/fit_interaction_to_display

tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity
tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity

scoreboard objectives remove sf_BlockDisplayResize
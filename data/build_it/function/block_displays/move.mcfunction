# Executed by Interaction
scoreboard objectives add sf_BlockDisplayMove dummy

say "Moved"

$execute store result score PosVal sf_BlockDisplayMove run data get entity @s Pos[$(position_index)] 1000
scoreboard players operation PosVal sf_BlockDisplayMove += @s StepSize_Move
$execute store result entity @s Pos[$(position_index)] double 0.001 run scoreboard players get PosVal sf_BlockDisplayMove

execute if entity @s[tag=BuildItBlockEntityInteraction] run tag @s add CurrentTargetInteractionEntity
execute if entity @s[tag=BuildItBlockEntityInteraction] run execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

execute if entity @s[tag=BuildItBlockEntityInteraction] run execute as @e[tag=CurrentTargetDisplayEntity] at @s run function build_it:block_displays/geometry/align_display_from_rotate

tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity
tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity

scoreboard objectives remove sf_BlockDisplayMove
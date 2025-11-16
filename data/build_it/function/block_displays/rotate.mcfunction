scoreboard objectives add StackFrame_RotatePart dummy

tag @s add CurrentTargetInteractionEntity
execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

$execute store result score RotationVal StackFrame_RotatePart run data get entity @s Rotation[$(rotation_index)] 10
scoreboard players operation RotationVal StackFrame_RotatePart += @s StepSize_Rotate
$execute store result entity @s Rotation[$(rotation_index)] float 0.1 run scoreboard players get RotationVal StackFrame_RotatePart

execute as @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity] at @s run function build_it:block_displays/geometry/align_display_from_rotate

tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity
tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity

scoreboard objectives remove StackFrame_RotatePart
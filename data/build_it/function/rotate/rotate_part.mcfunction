scoreboard objectives add StackFrame_RotatePart dummy

$execute store result score RotationVal StackFrame_RotatePart run data get entity @s Rotation[$(rotation_index)] 10
$scoreboard players $(add_or_remove) RotationVal StackFrame_RotatePart $(step)
$execute store result entity @s Rotation[$(rotation_index)] float 0.1 run scoreboard players get RotationVal StackFrame_RotatePart

execute if entity @s[tag=BuildItBlockEntityInteraction] run function build_it:utility/align_block_display_to_interaction

scoreboard objectives remove StackFrame_RotatePart
scoreboard objectives add StackFrame_MovePart dummy

say MovingPart
scoreboard players operation TargetId StackFrame_MovePart = @s EntityIds

$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MovePart run execute store result score PosVal StackFrame_MovePart run data get entity @s Pos[$(position_index)] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MovePart run scoreboard players $(add_or_remove) PosVal StackFrame_MovePart $(step)
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MovePart run execute store result entity @s Pos[$(position_index)] double 0.001 run scoreboard players get PosVal StackFrame_MovePart

execute if entity @s[tag=BuildItBlockEntityInteraction] run function build_it:move/align_block_display_move

scoreboard objectives remove StackFrame_MovePart
scoreboard objectives add StackFrame_RotatePitchCounterClockwise dummy

scoreboard players operation TargetId StackFrame_RotatePitchCounterClockwise = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchCounterClockwise run execute store result score Pitch StackFrame_RotatePitchCounterClockwise run data get entity @s Rotation[1] 10
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchCounterClockwise run scoreboard players remove Pitch StackFrame_RotatePitchCounterClockwise $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchCounterClockwise run execute store result entity @s Rotation[1] double 0.1 run scoreboard players get Pitch StackFrame_RotatePitchCounterClockwise

scoreboard objectives remove StackFrame_RotatePitchCounterClockwise
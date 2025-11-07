scoreboard objectives add StackFrame_RotatePitchClockwise dummy

scoreboard players operation TargetId StackFrame_RotatePitchClockwise = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchClockwise run execute store result score Pitch StackFrame_RotatePitchClockwise run data get entity @s Rotation[1] 10
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchClockwise run scoreboard players add Pitch StackFrame_RotatePitchClockwise $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotatePitchClockwise run execute store result entity @s Rotation[1] float 0.1 run scoreboard players get Pitch StackFrame_RotatePitchClockwise

scoreboard objectives remove StackFrame_RotatePitchClockwise
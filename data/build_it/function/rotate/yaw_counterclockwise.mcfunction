scoreboard objectives add StackFrame_RotateYawCounterClockwise dummy

scoreboard players operation TargetId StackFrame_RotateYawCounterClockwise = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawCounterClockwise run execute store result score Yaw StackFrame_RotateYawCounterClockwise run data get entity @s Rotation[0] 10
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawCounterClockwise run scoreboard players remove Yaw StackFrame_RotateYawCounterClockwise $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawCounterClockwise run execute store result entity @s Rotation[0] double 0.1 run scoreboard players get Yaw StackFrame_RotateYawCounterClockwise

scoreboard objectives remove StackFrame_RotateYawCounterClockwise
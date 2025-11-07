scoreboard objectives add StackFrame_RotateYawClockwise dummy

scoreboard players operation TargetId StackFrame_RotateYawClockwise = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawClockwise run execute store result score Yaw StackFrame_RotateYawClockwise run data get entity @s Rotation[0] 10
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawClockwise run scoreboard players add Yaw StackFrame_RotateYawClockwise $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_RotateYawClockwise run execute store result entity @s Rotation[0] float 0.1 run scoreboard players get Yaw StackFrame_RotateYawClockwise

scoreboard objectives remove StackFrame_RotateYawClockwise
scoreboard objectives add StackFrame_ScaleBigger dummy

scoreboard players operation TargetId StackFrame_ScaleBigger = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_ScaleBigger run execute store result score Scale StackFrame_ScaleBigger run data get entity @s Rotation[1] 10
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_ScaleBigger run scoreboard players add Scale StackFrame_ScaleBigger $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_ScaleBigger run execute store result entity @s Rotation[1] float 0.1 run scoreboard players get Scale StackFrame_ScaleBigger

scoreboard objectives remove StackFrame_ScaleBigger
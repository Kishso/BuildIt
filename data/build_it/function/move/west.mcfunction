scoreboard objectives add StackFrame_MoveWest dummy

scoreboard players operation TargetId StackFrame_MoveWest = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveWest run execute store result score PosX StackFrame_MoveWest run data get entity @s Pos[0] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveWest run scoreboard players remove PosX StackFrame_MoveWest $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveWest run execute store result entity @s Pos[0] double 0.001 run scoreboard players get PosX StackFrame_MoveWest

scoreboard objectives remove StackFrame_MoveWest
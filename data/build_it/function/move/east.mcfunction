scoreboard objectives add StackFrame_MoveEast dummy

scoreboard players operation TargetId StackFrame_MoveEast = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveEast run execute store result score PosX StackFrame_MoveEast run data get entity @s Pos[0] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveEast run scoreboard players add PosX StackFrame_MoveEast $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveEast run execute store result entity @s Pos[0] double 0.001 run scoreboard players get PosX StackFrame_MoveEast

scoreboard objectives remove StackFrame_MoveEast
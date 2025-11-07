scoreboard objectives add StackFrame_MoveDown dummy

scoreboard players operation TargetId StackFrame_MoveDown = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveDown run execute store result score PosY StackFrame_MoveDown run data get entity @s Pos[1] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveDown run scoreboard players remove PosY StackFrame_MoveDown $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveDown run execute store result entity @s Pos[1] double 0.001 run scoreboard players get PosY StackFrame_MoveDown

scoreboard objectives remove StackFrame_MoveDown
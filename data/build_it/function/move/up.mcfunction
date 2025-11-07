scoreboard objectives add StackFrame_MoveUp dummy

scoreboard players operation TargetId StackFrame_MoveUp = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveUp run execute store result score PosY StackFrame_MoveUp run data get entity @s Pos[1] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveUp run scoreboard players add PosY StackFrame_MoveUp $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveUp run execute store result entity @s Pos[1] double 0.001 run scoreboard players get PosY StackFrame_MoveUp

scoreboard objectives remove StackFrame_MoveUp
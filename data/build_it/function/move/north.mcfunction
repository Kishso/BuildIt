scoreboard objectives add StackFrame_MoveNorth dummy

scoreboard players operation TargetId StackFrame_MoveNorth = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveNorth run execute store result score PosZ StackFrame_MoveNorth run data get entity @s Pos[2] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveNorth run scoreboard players remove PosZ StackFrame_MoveNorth $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveNorth run execute store result entity @s Pos[2] double 0.001 run scoreboard players get PosZ StackFrame_MoveNorth

scoreboard objectives remove StackFrame_MoveNorth
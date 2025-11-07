scoreboard objectives add StackFrame_MoveSouth dummy

scoreboard players operation TargetId StackFrame_MoveSouth = @s EntityIds

execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveSouth run execute store result score PosZ StackFrame_MoveSouth run data get entity @s Pos[2] 1000
$execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveSouth run scoreboard players add PosZ StackFrame_MoveSouth $(step)
execute as @e[type=!minecraft:player] if score @s EntityIds = TargetId StackFrame_MoveSouth run execute store result entity @s Pos[2] double 0.001 run scoreboard players get PosZ StackFrame_MoveSouth

scoreboard objectives remove StackFrame_MoveSouth
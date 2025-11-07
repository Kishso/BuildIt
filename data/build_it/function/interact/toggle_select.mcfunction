scoreboard objectives add StackFrame dummy

scoreboard players set @s StackFrame 1
execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run scoreboard players set @s StackFrame 1

execute if score @e[type=minecraft:interaction, limit=1, scores={StackFrame=1}] PlayerSelectionTable = @s EntityIds run scoreboard players set ToggleOff StackFrame 1
execute unless score @e[type=minecraft:interaction, limit=1, scores={StackFrame=1}] PlayerSelectionTable = @s EntityIds run scoreboard players set ToggleOn StackFrame 1

execute if score ToggleOff StackFrame matches 1 run scoreboard players reset @e[type=minecraft:interaction, limit=1, scores={StackFrame=1}] PlayerSelectionTable
execute if score ToggleOn StackFrame matches 1 run scoreboard players operation @e[type=minecraft:interaction, limit=1, scores={StackFrame=1}] PlayerSelectionTable = @s EntityIds

scoreboard objectives remove StackFrame


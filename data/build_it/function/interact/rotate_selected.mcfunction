scoreboard objectives add StackFrame_RotateSelected dummy

scoreboard players operation TargetPlayer StackFrame_RotateSelected = @s EntityIds

team add TargetEntities

execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run execute if score @s PlayerSelectionTable = TargetPlayer StackFrame_RotateSelected run scoreboard players set IsSelected StackFrame_RotateSelected 1
execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run execute unless score @s PlayerSelectionTable = TargetPlayer StackFrame_RotateSelected run scoreboard players set IsSelected StackFrame_RotateSelected 0

execute if score IsSelected StackFrame_RotateSelected matches 0 run execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run team join TargetEntities
execute if score IsSelected StackFrame_RotateSelected matches 1 run execute as @e[tag=BuildItSelectable] if score @s PlayerSelectionTable = TargetPlayer StackFrame_RotateSelected run team join TargetEntities

scoreboard objectives add StepSize_Rotate dummy

execute as @e[team=TargetEntities] run scoreboard players set @s StepSize_Rotate 150

execute if predicate build_it:player_sneaking run execute as @e[team=TargetEntities] run scoreboard players operation @s StepSize_Rotate *= NegOne BuildItConstants

execute if entity @s[x_rotation=-45..45] run execute as @e[team=TargetEntities] run function build_it:block_displays/rotate {rotation_index:0}
execute if entity @s[x_rotation=45..-45] run execute as @e[team=TargetEntities] run function build_it:block_displays/rotate {rotation_index:1}

team remove TargetEntities
scoreboard objectives remove StackFrame_RotateSelected
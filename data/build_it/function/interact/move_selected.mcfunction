scoreboard objectives add StackFrame_MoveSelected dummy

scoreboard players operation TargetPlayer StackFrame_MoveSelected = @s EntityIds

team add TargetEntities

execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run execute if score @s PlayerSelectionTable = TargetPlayer StackFrame_MoveSelected run scoreboard players set IsSelected StackFrame_MoveSelected 1
execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run execute unless score @s PlayerSelectionTable = TargetPlayer StackFrame_MoveSelected run scoreboard players set IsSelected StackFrame_MoveSelected 0

execute if score IsSelected StackFrame_MoveSelected matches 0 run execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run team join TargetEntities
execute if score IsSelected StackFrame_MoveSelected matches 1 run execute as @e[tag=BuildItSelectable] if score @s PlayerSelectionTable = TargetPlayer StackFrame_MoveSelected run team join TargetEntities

scoreboard objectives add StepSize_Move dummy

execute as @e[team=TargetEntities] run scoreboard players set @s StepSize_Move 100

execute if predicate build_it:player_sneaking run execute as @e[team=TargetEntities] run scoreboard players operation @s StepSize_Move *= NegOne BuildItConstants

execute if entity @s[y_rotation=45..135, x_rotation=-45..45] run execute as @e[team=TargetEntities] run scoreboard players operation @s StepSize_Move *= NegOne BuildItConstants
execute if entity @s[y_rotation=135..-135, x_rotation=-45..45] run execute as @e[team=TargetEntities] run scoreboard players operation @s StepSize_Move *= NegOne BuildItConstants
execute if entity @s[x_rotation=45..90] run execute as @e[team=TargetEntities] run scoreboard players operation @s StepSize_Move *= NegOne BuildItConstants

execute if entity @s[y_rotation=135..-135, x_rotation=-45..45] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:2}
execute if entity @s[y_rotation=-45..45, x_rotation=-45..45] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:2}

execute if entity @s[y_rotation=-135..-45, x_rotation=-45..45] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:0}
execute if entity @s[y_rotation=45..135, x_rotation=-45..45] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:0}

execute if entity @s[x_rotation=-90..-45] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:1}
execute if entity @s[x_rotation=45..90] run execute as @e[team=TargetEntities] run function build_it:block_displays/move {position_index:1} 

team remove TargetEntities

scoreboard objectives remove StepSize_Move
scoreboard objectives remove StackFrame_MoveSelected
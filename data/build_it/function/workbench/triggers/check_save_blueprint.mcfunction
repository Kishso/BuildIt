
execute as @p[scores={build_it.save_blueprint=1}] run function build_it:project_management/save_project with entity @s SelectedItem.components.minecraft:custom_data
execute as @p[scores={build_it.save_blueprint=1..}] run scoreboard players reset @s build_it.save_blueprint

execute if entity @p[scores={build_it.save_blueprint=0}] run schedule function build_it:workbench/triggers/check_save_blueprint 1t
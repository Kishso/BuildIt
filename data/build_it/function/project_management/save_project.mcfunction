# executed as player saving project
scoreboard objectives add sf_SaveProject dummy

data modify storage build_it.saved_projects current_project set value {}

say "Saving Project..."
execute store result storage build_it.saved_projects current_project.author_id int 1.0 run scoreboard players get @s EntityIds
$data modify storage build_it.saved_projects current_project.project_name set value "$(project_name)"

execute store result score ProjectIndex sf_SaveProject run data get storage build_it.saved_projects next_project_idx 1
scoreboard players add ProjectIndex sf_SaveProject 1
execute store result storage build_it.saved_projects next_project_idx int 1 run scoreboard players get ProjectIndex sf_SaveProject

tag @s add TargetPlayer 

execute as @e[type=minecraft:interaction, tag=BuildIt_CreateProjectInteraction] if score @s EntityIds = @p[tag=TargetPlayer] PlayerCreateProjectTable run tag @s add CurrentProjectInteraction

execute as @e[type=interaction, tag=BuildIt_BlockDisplayInteraction] if score @s PlayerCreateProjectTable = @p[tag=TargetPlayer,limit=1] PlayerCreateProjectTable run function build_it:project_management/utility/save_block_display

data modify storage build_it.saved_projects projects append from storage build_it.saved_projects current_project
data remove storage build_it.saved_projects current_project

tag @s remove TargetPlayer
tag @e[type=minecraft:interaction, tag=CurrentProjectInteraction] remove CurrentProjectInteraction

scoreboard objectives remove sf_SaveProject
# executed as player saving project 

execute unless predicate build_it:player_holding_edit_blueprint_mainhand run return run msg @s "Error: Player not holding WIP blueprint"
$data modify entity @e[type=minecraft:interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project set value {}

$data modify entity @e[type=minecraft:interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.author_id set from entity @s UUID

$execute as @e[type=minecraft:item_display, nbt={data:{target_project:$(target_project)}}] run function build_it:project_management/helper/save_item_display_to_project with entity @s data

data modify storage build_it:functions blueprint.id set value "minecraft:book"
data modify storage build_it:functions blueprint.item_name set value "Project Blueprint"
data modify storage build_it:functions blueprint.item_model set value "build_it:blueprint_complete"
$data modify storage build_it:functions blueprint.custom_data.project_data set from entity @e[type=minecraft:interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project

function build_it:reward/helper/macro_give_custom_consumable_item with storage build_it:functions blueprint

data remove storage build_it:functions blueprint
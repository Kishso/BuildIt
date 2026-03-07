# executed as player interaction

data modify storage build_it:functions blueprint.id set value "minecraft:book"
data modify storage build_it:functions blueprint.item_name set value "Project Blueprint"
data modify storage build_it:functions blueprint.item_model set value "build_it:blueprint_complete"
$data modify storage build_it:functions blueprint.custom_data.project_data set from entity @e[type=minecraft:interaction, tag=BuildIt_PlacedProject, nbt={attack:{player:$(UUID)}}, limit=1] data.project_data

function build_it:reward/helper/macro_give_custom_consumable_item with storage build_it:functions blueprint

data remove storage build_it:functions blueprint

$function build_it:project_management/utility/remove_entities with entity @e[type=minecraft:interaction, tag=BuildIt_PlacedProject, nbt={attack:{player:$(UUID)}}, limit=1]
$kill @e[type=minecraft:interaction, tag=BuildIt_PlacedProject, nbt={attack:{player:$(UUID)}}]
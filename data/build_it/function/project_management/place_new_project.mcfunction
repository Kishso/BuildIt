 
function build_it:utility/raycast_facing_block {step_size:0.1, max_distance:5}

execute if data storage build_it:functions {raycast:{result:{success:0b}}} run return fail

summon minecraft:interaction ~ ~ ~ {Tags:["BuildIt_CreateProjectInteraction", "PendingEntityId", "CurrentProjectInteraction"]}
data modify entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, sort=nearest, limit=1] Pos set from storage build_it:functions raycast.result.last_air_pos 

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] at @s align xyz run tp @s ~0.5 ~ ~0.5

data modify storage build_it:functions blueprint.id set value "minecraft:book"
data modify storage build_it:functions blueprint.item_name set value "Blueprint and Pencil"
data modify storage build_it:functions blueprint.item_model set value "build_it:blueprint_edit"
data modify storage build_it:functions blueprint.custom_data.target_project set from entity @e[type=minecraft:interaction, tag=CurrentProjectInteraction, sort=nearest, limit=1] UUID

function build_it:reward/helper/macro_give_custom_item with storage build_it:functions blueprint

data remove storage build_it:functions blueprint
data remove storage build_it:functions raycast

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run tag @s remove CurrentProjectInteraction
execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id
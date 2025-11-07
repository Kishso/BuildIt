summon minecraft:interaction ~ ~ ~ {Tags:["BuildItSitInteraction", "BuildItSelectable", "PendingEntityId"]}
execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id
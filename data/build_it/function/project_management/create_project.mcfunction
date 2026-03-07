summon minecraft:interaction ~ ~ ~ {Tags:["BuildIt_CreateProjectInteraction", "PendingEntityId"]}

execute as @e[type=minecraft:interaction, tag=PendingEntityId] run tag @s add CurrentProjectInteraction
execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id

scoreboard players operation @s PlayerCreateProjectTable = @e[type=minecraft:interaction, tag=CurrentProjectInteraction] EntityIds

execute as @e[type=minecraft:interaction, tag=CurrentProjectInteraction] run tag @s remove CurrentProjectInteraction
summon minecraft:interaction ~ ~ ~ {Tags:["BuildItBlockEntityInteraction", "BuildItSelectable", "PendingEntityId", "AssignBlockDisplay"]}
execute as @e[type=minecraft:interaction, tag=AssignBlockDisplay, limit=1] at @s facing entity @s eyes run summon minecraft:block_display ^0.5 ^ ^-0.5 {Tags:["BuildItBlockEntity", "BeingPlaced"]}

execute as @e[tag=PendingEntityId] run function build_it:utility/add_entity_id

data modify entity @e[type=minecraft:block_display, tag=BeingPlaced, limit=1] block_state.Name set from entity @s SelectedItem.id

scoreboard players operation @e[type=minecraft:block_display, tag=BeingPlaced] BlockDisplays = @e[type=minecraft:interaction, tag=AssignBlockDisplay, limit=1] EntityIds

tag @e[type=minecraft:interaction, tag=AssignBlockDisplay] remove AssignBlockDisplay
tag @e[type=minecraft:block_display, tag=BeingPlaced] remove BeingPlaced





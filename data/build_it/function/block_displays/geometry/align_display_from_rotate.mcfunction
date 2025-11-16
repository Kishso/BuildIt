# Executed as Display Block
# Assumes current interaction and current display tags are set

scoreboard objectives add sf_AlignBlockDisplayFromRotate dummy

data modify entity @s Rotation set from entity @e[tag=CurrentTargetInteractionEntity, limit=1] Rotation

function build_it:block_displays/geometry/get_display_center {result_tag:CurrentDisplayCenter}

execute store result score InteractionX sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] Pos[0] 1000
execute store result score InteractionY sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] Pos[1] 1000
execute store result score InteractionZ sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] Pos[2] 1000

# Calculate Delta Vector from Interaction to Middle of Display Target
execute store result score DeltaX sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter, limit=1] Pos[0] 1000
scoreboard players operation DeltaX sf_AlignBlockDisplayFromRotate -= InteractionX sf_AlignBlockDisplayFromRotate
execute store result score DeltaY sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter, limit=1] Pos[1] 1000
scoreboard players operation DeltaY sf_AlignBlockDisplayFromRotate -= InteractionY sf_AlignBlockDisplayFromRotate
execute store result score DeltaZ sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter, limit=1] Pos[2] 1000
scoreboard players operation DeltaZ sf_AlignBlockDisplayFromRotate -= InteractionZ sf_AlignBlockDisplayFromRotate

# Account for display position being at the bottom
execute store result score InteractionHeight sf_AlignBlockDisplayFromRotate run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] height 1000
scoreboard players operation InteractionHeight sf_AlignBlockDisplayFromRotate /= Two BuildItConstants
scoreboard players operation DeltaY sf_AlignBlockDisplayFromRotate -= InteractionHeight sf_AlignBlockDisplayFromRotate

# Subtract Delta Vector from Display Coords
execute store result storage build_it:temp_distance deltaX float -0.001 run scoreboard players get DeltaX sf_AlignBlockDisplayFromRotate
execute store result storage build_it:temp_distance deltaY float -0.001 run scoreboard players get DeltaY sf_AlignBlockDisplayFromRotate
execute store result storage build_it:temp_distance deltaZ float -0.001 run scoreboard players get DeltaZ sf_AlignBlockDisplayFromRotate

execute as @e[type=minecraft:block_display, tag=CurrentTargetDisplayEntity] rotated as @s at @s run function build_it:block_displays/geometry/macro_relative_tp with storage build_it:temp_distance


kill @e[type=minecraft:armor_stand, tag=CurrentDisplayCenter]

scoreboard objectives remove sf_AlignBlockDisplayFromRotate
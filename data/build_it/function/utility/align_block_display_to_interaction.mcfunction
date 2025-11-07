scoreboard objectives add StackFrame_AlignBlockDisplay dummy

tag @s add CurrentTargetInteractionEntity
execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

data modify entity @e[tag=CurrentTargetDisplayEntity, limit=1] Rotation set from entity @e[tag=CurrentTargetInteractionEntity, limit=1] Rotation

execute as @e[tag=CurrentTargetInteractionEntity] at @e[tag=CurrentTargetInteractionEntity, limit=1] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true, Invisible:true , Tags:["TrigStand"]}
data modify entity @e[tag=TrigStand, limit=1] Rotation[0] set from entity @e[tag=CurrentTargetInteractionEntity, limit=1] Rotation[0]

execute as @e[tag=TrigStand] at @e[tag=TrigStand] run tp @s ^ ^ ^1

scoreboard players set RadiusDivisor StackFrame_AlignBlockDisplay 2 

# Sin Theta
execute store result score SinTheta StackFrame_AlignBlockDisplay run data get entity @e[type=minecraft:armor_stand, tag=TrigStand, limit=1] Pos[0] 1000
execute store result score XPos StackFrame_AlignBlockDisplay run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] Pos[0] 1000
scoreboard players operation SinTheta StackFrame_AlignBlockDisplay -= XPos StackFrame_AlignBlockDisplay 
# Cos Theta
execute store result score CosTheta StackFrame_AlignBlockDisplay run data get entity @e[type=minecraft:armor_stand, tag=TrigStand, limit=1] Pos[2] 1000
execute store result score ZPos StackFrame_AlignBlockDisplay run data get entity @e[type=minecraft:interaction, tag=CurrentTargetInteractionEntity, limit=1] Pos[2] 1000
scoreboard players operation CosTheta StackFrame_AlignBlockDisplay -= ZPos StackFrame_AlignBlockDisplay 

# Delta X
scoreboard players operation DeltaX StackFrame_AlignBlockDisplay = CosTheta StackFrame_AlignBlockDisplay
scoreboard players operation DeltaX StackFrame_AlignBlockDisplay += SinTheta StackFrame_AlignBlockDisplay

scoreboard players operation DeltaX StackFrame_AlignBlockDisplay /= RadiusDivisor StackFrame_AlignBlockDisplay

# Delta Z
scoreboard players operation DeltaZ StackFrame_AlignBlockDisplay = SinTheta StackFrame_AlignBlockDisplay
scoreboard players operation DeltaZ StackFrame_AlignBlockDisplay -= CosTheta StackFrame_AlignBlockDisplay

scoreboard players operation DeltaZ StackFrame_AlignBlockDisplay /= RadiusDivisor StackFrame_AlignBlockDisplay

# New X Pos
execute store result score NewXPos StackFrame_AlignBlockDisplay run data get entity @e[tag=CurrentTargetInteractionEntity, limit=1] Pos[0] 1000
execute unless entity @e[tag=CurrentTargetInteractionEntity, limit=1, x_rotation=45..225] run scoreboard players operation NewXPos StackFrame_AlignBlockDisplay -= DeltaX StackFrame_AlignBlockDisplay
execute if entity @e[tag=CurrentTargetInteractionEntity, limit=1, x_rotation=45..225] run scoreboard players operation NewXPos StackFrame_AlignBlockDisplay += DeltaX StackFrame_AlignBlockDisplay

execute store result entity @e[tag=CurrentTargetDisplayEntity, limit=1] Pos[0] double 0.001 run scoreboard players get NewXPos StackFrame_AlignBlockDisplay 

# New Z Pos
execute store result score NewZPos StackFrame_AlignBlockDisplay run data get entity @e[tag=CurrentTargetInteractionEntity, limit=1] Pos[2] 1000
execute if entity @e[tag=CurrentTargetInteractionEntity, limit=1, x_rotation=135..315] run scoreboard players operation NewZPos StackFrame_AlignBlockDisplay -= DeltaZ StackFrame_AlignBlockDisplay
execute unless entity @e[tag=CurrentTargetInteractionEntity, limit=1, x_rotation=135..315] run scoreboard players operation NewZPos StackFrame_AlignBlockDisplay += DeltaZ StackFrame_AlignBlockDisplay

execute store result entity @e[tag=CurrentTargetDisplayEntity, limit=1] Pos[2] double 0.001 run scoreboard players get NewZPos StackFrame_AlignBlockDisplay

kill @e[tag=TrigStand]

tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity
tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity

scoreboard objectives remove StackFrame_AlignBlockDisplay
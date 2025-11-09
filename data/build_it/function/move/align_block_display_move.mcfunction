scoreboard objectives add StackFrame_AlignBlockDisplayMove dummy

tag @s add CurrentTargetInteractionEntity
execute as @e[tag=BuildItBlockEntity] if score @s BlockDisplays = @e[tag=CurrentTargetInteractionEntity,limit=1] EntityIds run tag @s add CurrentTargetDisplayEntity

tp @e[tag=CurrentTargetDisplayEntity] @e[tag=CurrentTargetInteractionEntity, limit=1]

tag @e[tag=CurrentTargetInteractionEntity] remove CurrentTargetInteractionEntity
tag @e[tag=CurrentTargetDisplayEntity] remove CurrentTargetDisplayEntity

scoreboard objectives remove StackFrame_AlignBlockDisplayMove
# executed as project interaction

tag @s add CurrentProjectInteraction

execute as @e[type=block_display, tag=BuildIt_BlockDisplay] if score @s ProjectPiecesTable = @e[type=minecraft:interaction, tag=CurrentProjectInteraction, limit=1] EntityIds run kill @s
kill @s
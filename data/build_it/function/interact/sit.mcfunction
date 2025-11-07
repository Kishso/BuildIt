scoreboard objectives add RelationTable dummy

scoreboard players set @s RelationTable 1
execute as @e[type=minecraft:interaction,tag=BuildItSitInteraction] if data entity @s interaction run scoreboard players set @s RelationTable 1

ride @s mount @e[type=minecraft:interaction, limit=1, scores={RelationTable=1}]

execute as @e[type=minecraft:interaction,tag=BuildItSitInteraction] if data entity @s interaction run data remove entity @s interaction

scoreboard objectives remove RelationTable

advancement revoke @s only build_it:sit
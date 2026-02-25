$execute store result score @s build_it.cursor.selected_uuid1 run data get entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={interaction:{player:$(UUID)}}, limit=1] UUID[0] 1
$execute store result score @s build_it.cursor.selected_uuid2 run data get entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={interaction:{player:$(UUID)}}, limit=1] UUID[1] 1
$execute store result score @s build_it.cursor.selected_uuid3 run data get entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={interaction:{player:$(UUID)}}, limit=1] UUID[2] 1
$execute store result score @s build_it.cursor.selected_uuid4 run data get entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={interaction:{player:$(UUID)}}, limit=1] UUID[3] 1 

$data remove entity @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={interaction:{player:$(UUID)}}, limit=1] interaction
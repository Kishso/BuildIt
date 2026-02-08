$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}, data:{cursor_type:"item_display"}}, limit=1] run data modify entity @s data.new_cursor_type set value "block_display"
$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}, data:{cursor_type:"block_display"}}, limit=1] run data modify entity @s data.new_cursor_type set value "action"
$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}, data:{cursor_type:"action"}}, limit=1] run data modify entity @s data.new_cursor_type set value "item_display"

$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}}] if data entity @s data.new_cursor_type run data modify entity @s data.cursor_type set from entity @s data.new_cursor_type
$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}}] if data entity @s data.new_cursor_type run data remove entity @s data.new_cursor_type

$execute as @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}}] run function build_it:cursor/update_item_model with entity @s data

$data remove entity @e[type=minecraft:interaction, nbt={attack:{player:$(UUID)}}, limit=1] attack
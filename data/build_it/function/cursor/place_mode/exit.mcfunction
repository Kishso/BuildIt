
$execute as @e[type=minecraft:interaction, tag=BuildIt_PlaceCursor, nbt={data:{target_player:$(UUID)}}, limit=1] run function build_it:cursor/place_mode/remove_cursor with entity @s data
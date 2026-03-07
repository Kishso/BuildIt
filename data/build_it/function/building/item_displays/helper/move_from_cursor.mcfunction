$execute as @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={UUID:$(cursor_uuid)}, limit=1] run data modify storage build_it:functions move_display.target_display set from entity @s data.target_entity
$execute as @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={UUID:$(cursor_uuid)}, limit=1] run data modify storage build_it:functions move_display.target_cursor set from entity @s UUID
$execute as @e[type=minecraft:interaction, tag=BuildIt_EditCursor, nbt={UUID:$(cursor_uuid)}, limit=1] run data modify storage build_it:functions move_display.cursor_display set from entity @s data.cursor_display
function build_it:building/item_displays/helper/move_target_display with storage build_it:functions move_display

data remove storage build_it:functions move_display
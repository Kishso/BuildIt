$execute as @p[nbt={UUID:$(target_player)}] if predicate build_it:player_holding_edit_blueprint run return fail

$kill @e[type=minecraft:item_display,nbt={UUID:$(cursor_display)}]
kill @s

$advancement revoke @p[nbt={UUID:$(target_player)}] only build_it:hold_edit_blueprint
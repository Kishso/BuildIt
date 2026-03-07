execute unless data entity @s interaction run return fail

execute as @s[nbt={data:{cursor_type:"item_display"}}] run function build_it:building/item_displays/place_from_hand with entity @s data
execute as @s[nbt={data:{cursor_type:"block_display"}}] run function build_it:building/block_displays/place_from_hand with entity @s data
execute as @s[nbt={data:{cursor_type:"action"}}] run function build_it:building/actions/place_from_hand with entity @s data

data remove entity @s interaction
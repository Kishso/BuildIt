# Executed as Project Interaction

execute unless data entity @s data.current_project.item_displays[0] run return run say "No More Item Displays..."

say "Placing Item Display"
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:[BeingPlaced]}
data modify entity @e[type=item_display, tag=BeingPlaced, limit=1] data.target_project set from entity @s UUID
data modify entity @e[type=item_display, tag=BeingPlaced, limit=1] item set from entity @s data.current_project.item_displays[0].item
data modify entity @e[type=item_display, tag=BeingPlaced, limit=1] transformation set from entity @s data.current_project.item_displays[0].transformation

data remove entity @s data.current_project.item_displays[0]

execute as @e[type=minecraft:item_display] run tag @s remove BeingPlaced

# Recursive Call
function build_it:project_management/utility/place_item_displays




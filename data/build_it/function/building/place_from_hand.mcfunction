# Place What is Currently in Players Hand, executed with Place It Cursor

# Do Just Block Display, add item displays and interactions later
$execute at @e[type=minecraft:interaction, nbt={UUID:$(UUID)}] align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Tags:["BeingPlaced"]}
data modify entity @e[type=minecraft:item_display, tag=BeingPlaced, limit=1] item set from entity @s SelectedItem

execute as @e[type=minecraft:item_display, tag=BeingPlaced] run tag @s remove BeingPlaced
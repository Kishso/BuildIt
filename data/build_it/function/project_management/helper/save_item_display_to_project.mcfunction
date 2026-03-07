$data modify entity @e[type=interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.current_entity.item set from entity @s item
$data modify entity @e[type=interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.current_entity.transformation set from entity @s transformation

$data modify entity @e[type=interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.item_displays append from entity @e[type=interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.current_entity

$data remove entity @e[type=interaction, nbt={UUID:$(target_project)}, limit=1] data.current_project.current_entity
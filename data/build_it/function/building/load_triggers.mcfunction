scoreboard objectives add build_it.edit_dialog_open trigger edit_dialog_open

scoreboard objectives add build_it.trigger.edit_move trigger build_it.trigger.edit_move

scoreboard objectives add build_it.selected_slot dummy
scoreboard objectives add build_it.selected_slot_delta dummy

scoreboard objectives add build_it.building.move_step dummy

scoreboard objectives add build_it.trigger.move_settings trigger

scoreboard objectives add build_it.building.selected_axis dummy
execute as @p unless score @s build_it.building.selected_axis matches 0.. run scoreboard players set @s build_it.building.selected_axis 0

scoreboard objectives add build_it.building.pitch dummy
scoreboard objectives add build_it.building.yaw dummy
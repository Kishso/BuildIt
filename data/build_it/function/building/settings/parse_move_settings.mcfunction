execute store result storage build_it:functions parse_move_settings.input1 int 1 run scoreboard players get @s build_it.trigger.move_settings
data modify storage build_it:functions parse_move_settings.input2 set value 10

function build_it:calculator/modulus with storage build_it:functions parse_move_settings
execute store result score @s build_it.building.selected_axis run data get storage build_it:calculator result 1.0

function build_it:calculator/divide with storage build_it:functions parse_move_settings
execute store result score @s build_it.building.move_step run data get storage build_it:calculator result 1.0

data remove storage build_it:functions parse_move_settings
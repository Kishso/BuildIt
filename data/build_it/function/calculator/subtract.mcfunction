scoreboard objectives add sf_Calculator dummy

execute if score DebugMessages BuildItConstants = One BuildItConstants run say "Subtracting..."

$data modify storage build_it.calculator input1 set value $(input1) 
$data modify storage build_it.calculator input2 set value $(input2) 

execute store result score Input1 sf_Calculator run data get storage build_it.calculator input1 1000
execute store result score Input2 sf_Calculator run data get storage build_it.calculator input2 1000

scoreboard players operation Result sf_Calculator = Input1 sf_Calculator 
scoreboard players operation Result sf_Calculator -= Input2 sf_Calculator

execute store result storage build_it.calculator result double 0.001 run scoreboard players get Result sf_Calculator
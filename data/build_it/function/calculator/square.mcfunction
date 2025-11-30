scoreboard objectives add sf_Calculator dummy

$data modify storage build_it.calculator input1 set value $(input) 

execute store result score Input sf_Calculator run data get storage build_it.calculator input 1000

scoreboard players operation Result sf_Calculator = Input sf_Calculator 
scoreboard players operation Result sf_Calculator *= Input sf_Calculator

# We multipied scale by itself so need to correct for that
scoreboard players operation Result sf_Calculator /= #1000 BuildItConstants

execute store result storage build_it.calculator result double 0.001 run scoreboard players get Result sf_Calculator
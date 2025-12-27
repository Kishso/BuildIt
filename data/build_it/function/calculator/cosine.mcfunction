scoreboard objectives add sf_Calculator dummy

$data modify storage build_it:calculator cosine.angle set value $(angle)
$data modify storage build_it:calculator cosine.magnitude set value $(magnitude)

execute at @s run summon armor_stand ~ ~ ~ {NoGravity: true, Invisible: true, Tags:["CurrentTrigStand"]}

data modify entity @e[type=minecraft:armor_stand, tag=CurrentTrigStand, limit=1] Rotation[0] set from storage build_it:calculator cosine.angle

data modify storage build_it:calculator.trig distance_side set value 0
data modify storage build_it:calculator.trig distance_up set value 0
data modify storage build_it:calculator.trig distance_forward set from storage build_it:calculator cosine.magnitude

execute as @e[type=minecraft:armor_stand, tag=CurrentTrigStand] at @s rotated as @s run function build_it:block_displays/geometry/macro_vector_tp with storage build_it:calculator.trig

data modify storage build_it:calculator cosine.input1 set from entity @s Pos[2]
data modify storage build_it:calculator cosine.input2 set from entity @e[type=minecraft:armor_stand, tag=CurrentTrigStand, limit=1] Pos[2]

function build_it:calculator/subtract with storage build_it:calculator cosine

kill @e[type=minecraft:armor_stand, tag=CurrentTrigStand]
scoreboard objectives remove sf_Calculator 

data remove storage build_it:calculator cosine
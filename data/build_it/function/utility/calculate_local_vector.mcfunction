# Calculates the local coordinate distance between two entities,
# executed by the destination entity, should be executed with an entity
# tagged CurrentOriginEntity to act as the origin entity
# Stores result in storage
scoreboard objectives add sf_CalcLocalVector dummy

# Calculate total distance between two entities in 3D space
data modify storage build_it.calculator input1 set from entity @s Pos[0]
data modify storage build_it.calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[0]

function build_it:calculator/subtract with storage build_it.calculator
data modify storage build_it.calculator input set from storage build_it.calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaX: "},{"storage":"build_it.calculator","nbt":"result"}]

function build_it:calculator/square with storage build_it.calculator

data modify storage build_it:temp_distance deltaX2 set from storage build_it.calculator result

data modify storage build_it.calculator input1 set from entity @s Pos[1]
data modify storage build_it.calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[1]

function build_it:calculator/subtract with storage build_it.calculator
data modify storage build_it.calculator input set from storage build_it.calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaY: "},{"storage":"build_it.calculator","nbt":"result"}]

function build_it:calculator/square with storage build_it.calculator
data modify storage build_it:temp_distance deltaY2 set from storage build_it.calculator result

data modify storage build_it.calculator input1 set from entity @s Pos[2]
data modify storage build_it.calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[2]

function build_it:calculator/subtract with storage build_it.calculator
data modify storage build_it.calculator input set from storage build_it.calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaZ: "},{"storage":"build_it.calculator","nbt":"result"}]

function build_it:calculator/square with storage build_it.calculator
data modify storage build_it:temp_distance deltaZ2 set from storage build_it.calculator result

# Add all three
data modify storage build_it.calculator input1 set from storage build_it:temp_distance deltaX2
data modify storage build_it.calculator input2 set from storage build_it:temp_distance deltaY2

function build_it:calculator/add with storage build_it.calculator

data modify storage build_it.calculator input1 set from storage build_it.calculator result
data modify storage build_it.calculator input2 set from storage build_it:temp_distance deltaZ2

function build_it:calculator/add with storage build_it.calculator

data modify storage build_it.calculator input set from storage build_it.calculator result

function build_it:calculator/square_root with storage build_it.calculator

data modify storage build_it:temp_distance totalDistance set from storage build_it.calculator result

# Calculate Delta Pitch & Yaw
execute as @e[tag=CurrentOriginEntity,limit=1,sort=nearest] at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true, Invisible: false, Tags:["DeltaAngleStand"]}
tp @e[type=minecraft:armor_stand, tag=DeltaAngleStand,limit=1] ~ ~ ~ facing entity @s feet


# Use Trig to Calculate Up/Down and Hypotenuse of X/Z Plane

# Use Trig & Hypotenuse of X/Z Plane to get Side/Side and Forwards/Backwards

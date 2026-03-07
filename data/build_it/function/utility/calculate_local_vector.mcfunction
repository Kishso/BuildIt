# Calculates the local coordinate distance between two entities,
# executed by the destination entity, should be executed with an entity
# tagged CurrentOriginEntity to act as the origin entity
# Stores result in storage

# Get World Vector
data modify storage build_it:calculator input1 set from entity @s Pos[0]
data modify storage build_it:calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[0]

function build_it:calculator/subtract with storage build_it:calculator

data modify storage build_it:calculator vector.input.x set from storage build_it:calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaX: "},{"storage":"build_it:calculator","nbt":"result"}]

data modify storage build_it:calculator input1 set from entity @s Pos[1]
data modify storage build_it:calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[1]

function build_it:calculator/subtract with storage build_it:calculator

data modify storage build_it:calculator vector.input.y set from storage build_it:calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaY: "},{"storage":"build_it:calculator","nbt":"result"}]

data modify storage build_it:calculator input1 set from entity @s Pos[2]
data modify storage build_it:calculator input2 set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Pos[2]
 
function build_it:calculator/subtract with storage build_it:calculator

data modify storage build_it:calculator vector.input.z set from storage build_it:calculator result
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"DeltaZ: "},{"storage":"build_it:calculator","nbt":"result"}]

# Get Pitch & Yaw

data modify storage build_it:calculator vector.input.yaw set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Rotation[0]
data modify storage build_it:calculator vector.input.pitch set from entity @e[tag=CurrentOriginEntity,limit=1,sort=nearest] Rotation[1]

# Convert to Local Vector

function build_it:calculator/vector/convert_global_to_local with storage build_it:calculator vector.input

# Store Result

data modify storage build_it:vector result.distance_side set from storage build_it:calculator result.x
data modify storage build_it:vector result.distance_up set from storage build_it:calculator result.y
data modify storage build_it:vector result.distance_forward set from storage build_it:calculator result.z

execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{text:"Distance Side: "},{storage:"build_it:vector",nbt:"result.distance_side"}]
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{text:"Distance Up: "},{storage:"build_it:vector",nbt:"result.distance_up"}]
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{text:"Distance Forward: "},{storage:"build_it:vector",nbt:"result.distance_forward"}]

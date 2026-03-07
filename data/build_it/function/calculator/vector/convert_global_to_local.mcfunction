scoreboard objectives add sf_Calculator dummy

$data modify storage build_it:calculator vector.x set value $(x)
$data modify storage build_it:calculator vector.y set value $(y)
$data modify storage build_it:calculator vector.z set value $(z)

$data modify storage build_it:calculator vector.yaw set value $(yaw)
$data modify storage build_it:calculator vector.pitch set value $(pitch)

execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{text:"Input Vector: <"},{storage:"build_it:calculator",nbt:"vector.x"},{text:", "},{storage:"build_it:calculator",nbt:"vector.y"},{text:", "},{storage:"build_it:calculator",nbt:"vector.z"}, {text:">"}]

# Flip X Direction
data modify storage build_it:calculator input1 set from storage build_it:calculator vector.x
data modify storage build_it:calculator input2 set value -1
function build_it:calculator/multiply with storage build_it:calculator

data modify storage build_it:calculator vector.x set from storage build_it:calculator result

# Flip Y Direction
data modify storage build_it:calculator input1 set from storage build_it:calculator vector.y
data modify storage build_it:calculator input2 set value -1
function build_it:calculator/multiply with storage build_it:calculator

data modify storage build_it:calculator vector.y set from storage build_it:calculator result

# Apply Yaw Rotation
data modify storage build_it:calculator vector.input.angle set from storage build_it:calculator vector.yaw

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.x
function build_it:calculator/cosine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input1 set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.z
function build_it:calculator/sine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input2 set from storage build_it:calculator result

function build_it:calculator/add with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.result.x set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.z
function build_it:calculator/cosine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input1 set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.x
function build_it:calculator/sine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input2 set from storage build_it:calculator result

function build_it:calculator/subtract with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.temp.newZ set from storage build_it:calculator result


# Apply Pitch Rotation 
data modify storage build_it:calculator vector.input.angle set from storage build_it:calculator vector.pitch

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.temp.newZ
function build_it:calculator/cosine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input1 set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.y
function build_it:calculator/sine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input2 set from storage build_it:calculator result

function build_it:calculator/add with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.result.z set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.y
function build_it:calculator/cosine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input1 set from storage build_it:calculator result

data modify storage build_it:calculator vector.input.magnitude set from storage build_it:calculator vector.temp.newZ
function build_it:calculator/sine with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.input.input2 set from storage build_it:calculator result

function build_it:calculator/subtract with storage build_it:calculator vector.input

data modify storage build_it:calculator vector.result.y set from storage build_it:calculator result

# Cleanup/Store Result

data modify storage build_it:calculator result set from storage build_it:calculator vector.result

data remove storage build_it:calculator vector

scoreboard objectives remove sf_Calculator 

data remove storage build_it:calculator vector
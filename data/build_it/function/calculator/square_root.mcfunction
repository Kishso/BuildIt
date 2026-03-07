# This is a recursive Baybloynian approach to calculating a square root
scoreboard objectives add sf_Calculator dummy

# If this our first time, set iteration to zero
execute unless score Iteration sf_Calculator matches 1.. run scoreboard players set Iteration sf_Calculator 0

$execute if score Iteration sf_Calculator matches 0 run data modify storage build_it:calculator square_root.input set value $(input)

execute if score Iteration sf_Calculator matches 0 run execute store result score Root sf_Calculator run data get storage build_it:calculator square_root.input 1000

# Check if root is negative, we do not support imaginary numbers
execute if score Iteration sf_Calculator matches 0 run execute if score DebugMessages BuildItConstants matches 1 run execute if score Root sf_Calculator < Zero BuildItConstants run say "Input Invalid"
execute if score Iteration sf_Calculator matches 0 run execute if score Root sf_Calculator < Zero BuildItConstants run scoreboard players set Root sf_Calculator 0

# For our initial guess, lets just do try initial value
execute if score Iteration sf_Calculator matches 0 run scoreboard players operation CurrentGuess sf_Calculator = Root sf_Calculator

execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"Current Guess:"}, {"score":{"name":"CurrentGuess","objective":"sf_Calculator"}}]
# Now, lets calculate the next step
scoreboard players operation PreviousGuess sf_Calculator = CurrentGuess sf_Calculator

scoreboard players operation CurrentGuess sf_Calculator = Root sf_Calculator
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"Step 1 Current Guess:"}, {"score":{"name":"CurrentGuess","objective":"sf_Calculator"}}]

# Need to apply the scale twice before this operation due to dividing scale by itself
scoreboard players operation CurrentGuess sf_Calculator *= #1000 BuildItConstants

scoreboard players operation CurrentGuess sf_Calculator /= PreviousGuess sf_Calculator

execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"Step 2 Current Guess:"}, {"score":{"name":"CurrentGuess","objective":"sf_Calculator"}}]


scoreboard players operation CurrentGuess sf_Calculator += PreviousGuess sf_Calculator
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"Step 3 Current Guess:"}, {"score":{"name":"CurrentGuess","objective":"sf_Calculator"}}]

scoreboard players operation CurrentGuess sf_Calculator /= Two BuildItConstants
execute if score DebugMessages BuildItConstants matches 1 run tellraw @p [{"text":"Step 4 Current Guess:"}, {"score":{"name":"CurrentGuess","objective":"sf_Calculator"}}]


scoreboard players add Iteration sf_Calculator 1

execute unless score CurrentGuess sf_Calculator = PreviousGuess sf_Calculator run function build_it:calculator/square_root with storage build_it:calculator square_root

# Cleanup ending conditionst
execute if score CurrentGuess sf_Calculator = PreviousGuess sf_Calculator run execute store result storage build_it:calculator result double 0.001 run scoreboard players get CurrentGuess sf_Calculator
execute if score CurrentGuess sf_Calculator = PreviousGuess sf_Calculator run data remove storage build_it:calculator square_root
execute if score CurrentGuess sf_Calculator = PreviousGuess sf_Calculator run scoreboard objectives remove sf_Calculator

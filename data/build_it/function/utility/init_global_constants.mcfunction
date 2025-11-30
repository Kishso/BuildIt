
scoreboard players set NegOne BuildItConstants -1

scoreboard players set Zero BuildItConstants 0
scoreboard players set One BuildItConstants 1
scoreboard players set Two BuildItConstants 2
scoreboard players set #1000 BuildItConstants 1000

execute unless score DebugMessages BuildItConstants matches 0..1 run scoreboard players set DebugMessages BuildItConstants 0

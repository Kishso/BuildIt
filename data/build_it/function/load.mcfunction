scoreboard objectives add PlayerSelectionTable dummy
scoreboard objectives add EntityIds dummy

scoreboard objectives add BlockDisplays dummy


execute unless score NextId EntityIds matches 0..2147483647 run scoreboard players set NextId EntityIds 0
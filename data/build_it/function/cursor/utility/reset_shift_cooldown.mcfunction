scoreboard players remove @p build_it.cursor.sneak_cooldown 1

execute as @p[scores={build_it.cursor.sneak_cooldown=0}] run scoreboard players reset @s build_it.cursor.sneak_cooldown
execute if score @p build_it.cursor.sneak_cooldown matches 1.. run schedule function build_it:cursor/utility/reset_shift_cooldown 1t
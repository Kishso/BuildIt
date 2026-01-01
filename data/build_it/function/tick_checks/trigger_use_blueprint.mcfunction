
execute as @p if score @s build_it.use_blueprint matches -1 run advancement revoke @s only build_it:open_blank_blueprint

execute as @p if score @s build_it.use_blueprint matches -2147483648..2147483647 run scoreboard players reset @s build_it.use_blueprint
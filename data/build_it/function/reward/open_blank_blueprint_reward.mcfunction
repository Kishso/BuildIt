say "Blueprint Opened..."

kill @e[type=minecraft:eye_of_ender,sort=nearest,limit=1] 

scoreboard objectives add build_it.use_blueprint trigger use_blueprint
scoreboard players enable @s build_it.use_blueprint

dialog show @s build_it:start_project

advancement revoke @s only build_it:open_blank_blueprint
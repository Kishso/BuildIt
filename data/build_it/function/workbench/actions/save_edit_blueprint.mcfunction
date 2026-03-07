execute unless predicate build_it:blueprints/holding_edit_blueprint_mainhand run return run say "Player must be holding edit blueprint!"

scoreboard objectives add build_it.save_blueprint trigger
scoreboard players enable @s build_it.save_blueprint

dialog show @s build_it:blueprints/save_edit_blueprint

schedule function build_it:workbench/triggers/check_save_blueprint 1t

advancement revoke @s only build_it:workbench/interact_edit_blueprint
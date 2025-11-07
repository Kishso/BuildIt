scoreboard objectives add StackFrame_HitInteraction dummy

execute unless entity @s[nbt={SelectedItem:{}}] run scoreboard players set HasItem StackFrame_HitInteraction 0
execute if entity @s[nbt={SelectedItem:{}}] run scoreboard players set HasItem StackFrame_HitInteraction 1

execute if score HasItem StackFrame_HitInteraction matches 0 run function build_it:interact/toggle_select

execute if score HasItem StackFrame_HitInteraction matches 1 run execute if entity @s[nbt={SelectedItem:{components:{"minecraft:item_model":"build_it:hammer_move"}}}] run function build_it:interact/move_selected
execute if score HasItem StackFrame_HitInteraction matches 1 run execute if entity @s[nbt={SelectedItem:{components:{"minecraft:item_model":"build_it:hammer_rotate"}}}] run function build_it:interact/rotate_selected


execute as @e[type=minecraft:interaction,tag=BuildItSelectable] if data entity @s attack run data remove entity @s attack

scoreboard objectives remove StackFrame_HitInteraction

advancement revoke @s only build_it:hit_selectable
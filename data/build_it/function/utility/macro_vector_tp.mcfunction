# Execute as the entity that needs to move forward
$execute if score DebugMessages BuildItConstants = One BuildItConstants run say "Moving ^$(distance_side) ^$(distance_up) ^$(distance_forward)"

$tp @s ^$(distance_side) ^$(distance_up) ^$(distance_forward)
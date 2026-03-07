# Execute as entity getting rotated.
# Requires two entities, one tagged CurrentOriginEntity, one tagged NewOriginEntity

# Get Relative Local Coords
function build_it:utility/calculate_local_vector
# Teleport at new origin, rotated as new origin but teleport self
execute at @e[tag=NewOriginEntity, sort=nearest, limit=1] rotated as @e[tag=NewOriginEntity, sort=nearest, limit=1] run function build_it:block_displays/geometry/macro_vector_tp with storage build_it:vector result
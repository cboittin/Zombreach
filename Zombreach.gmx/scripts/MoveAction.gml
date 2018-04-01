character = argument0;
destination = argument1;

with(character) {
    destination = other.destination;
    pathfinder = destination.parent.pathfinder;
    
    // Easy checks
    if(instance_exists(destination.unit))
        return global.UNIT_EXISTS; // Can't move to an occupied cell
    if(!RangeCheck(cell, destination, movement, global.RANGE_MANHATTAN) )
        return global.OUT_OF_RANGE; // Tring to move too far
    
    // Pathfinding
    mp_grid_clear_cell(pathfinder, cell.indexX, cell.indexY);
    path_clear_points(path);
    pathExists = mp_grid_path(pathfinder, path, x, y, 
        destination.centerX, destination.centerY, false);
    
    tooFar = false;
    if(pathExists && (path_get_length(path) / global.CELL_SIZE) <= movement) {
        cell.unit = noone;
        cell = destination;
        destination.unit = self;
        x = destination.centerX;
        y = destination.centerY;
    } else {
        tooFar = true;
    }
    mp_grid_add_instances(pathfinder, self, false);
    if(tooFar)
        return global.OUT_OF_RANGE;
}
return global.RETURN_OK;

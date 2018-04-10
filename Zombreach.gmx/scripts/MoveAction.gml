var character = argument0;
var destination = argument1;
var state = argument2;

with(character) {
    if(self.hasMoved) {
        return global.RETURN_ERROR;
    }

    var distance = ManhattanDistance(cell, destination);
    var grid = state.grid;
    var pathfinder = grid.pathfinder;
    
    // Easy checks
    if(instance_exists(destination.unit))
        return global.UNIT_EXISTS; // Can't move to an occupied cell
    if(!RangeCheck(cell, destination, movement, global.RANGE_MANHATTAN) )
        return global.OUT_OF_RANGE; // Tring to move too far
    
    // Pathfinding
    mp_grid_clear_cell(pathfinder, cell.indexX, cell.indexY);
    path_clear_points(path);
    var pathExists = mp_grid_path(pathfinder, path, x, y, 
        destination.centerX, destination.centerY, false);
    
    var tooFar = false;
    if(pathExists == true && (path_get_length(path) / global.CELL_SIZE) <= movement) {
        MoveCharacter(self, destination);
        
        // Noise
        for(var i = 1; i < path_get_number(path); i += 1) {
            var px = path_get_point_x(path, i) - grid.x;
            var py = path_get_point_y(path, i) - grid.y;
            var xIndex = floor(px / global.CELL_SIZE);
            var yIndex = floor(py / global.CELL_SIZE);
            grid.cells[xIndex, yIndex].noise += distance - 1;
            state.noise += distance - 1;
        }
    } else {
        tooFar = true;
    }
    mp_grid_add_instances(pathfinder, self, false);
    if(tooFar)
        return global.OUT_OF_RANGE;
}
character.hasMoved = true;
// Check for grab and special action
InitializeActionMenu(state);
ActionEnd(state);
return global.RETURN_OK;


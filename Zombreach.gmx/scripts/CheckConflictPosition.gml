/*** Check if any tuple in the positions list conflicts with the object
given by its grid coordinates and shape */
var positions = argument0;
var objX = argument1;
var objY = argument2;
var occupiedCells = argument3;

for(var j = 0; j < ds_list_size(positions); j += 1) {
    var tupCheck = ds_list_find_value(positions, j);
    if(objX == tupCheck[0]) {
        if( objY == tupCheck[1] ||
                (occupiedCells & global.CELL_BOTTOM && objY + 1 == tupCheck[1]) ||
                (occupiedCells & global.CELL_TOP && objY - 1 == tupCheck[1]) ) {
            return false;
        }
    } else if( objY == tupCheck[1]) {
        if( (occupiedCells & global.CELL_RIGHT && objX + 1 == tupCheck[0]) ||
                (occupiedCells & global.CELL_LEFT && objX - 1 == tupCheck[0]) ) {
            return false;
        }
    }
}
return true;


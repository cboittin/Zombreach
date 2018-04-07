var prop = argument0;
var grid = argument1;
var cx = argument2;
var cy = argument3;

var cell = grid.cells[cx, cy];
cell.prop = prop;
prop.x = cell.x + 1;
prop.y = cell.y + 1;
prop.cell = cell;

if(prop.occupiedCells & global.CELL_RIGHT)
    grid.cells[cx + 1, cy].prop = prop;
if(prop.occupiedCells & global.CELL_LEFT)
    grid.cells[cx - 1, cy].prop = prop;
if(prop.occupiedCells & global.CELL_BOTTOM)
    grid.cells[cx, cy + 1].prop = prop;
if(prop.occupiedCells & global.CELL_TOP)
    grid.cells[cx, cy - 1].prop = prop;


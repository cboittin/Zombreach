var character = argument0;
var grid = argument1;
var cx = argument2;
var cy = argument3;

var cell = grid.cells[cx, cy];
cell.unit = character
cell.unit.x = cell.centerX;
cell.unit.y = cell.centerY;
character.cell = cell;

mp_grid_add_instances(grid.pathfinder, character, false);


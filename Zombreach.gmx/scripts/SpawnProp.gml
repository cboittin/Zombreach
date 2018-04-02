var prop = argument0;
var grid = argument1;
var cx = argument2;
var cy = argument3;

var cell = grid.cells[cx, cy];
cell.prop = prop;
prop.x = cell.centerX;
prop.y = cell.centerY;
prop.cell = cell;


character = argument0;
grid = argument1;
cx = argument2;
cy = argument3;

cell = grid.cells[cx, cy];
cell.unit = character
cell.unit.x = cell.centerX;
cell.unit.y = cell.centerY;
cell.unit.cell = cell;

mp_grid_add_instances(grid.pathfinder, character, false);


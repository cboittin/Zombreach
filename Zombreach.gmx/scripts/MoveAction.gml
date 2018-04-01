character = argument0;
cell = argument1;

if(instance_exists(cell.unit))
    return global.UNIT_EXISTS; // Can't move to an occupied cell
if(!RangeCheck(character.cell, cell, character.movement, global.RANGE_MANHATTAN) )
    return global.OUT_OF_RANGE; // Tring to move too far

character.cell.unit = noone;
mp_grid_clear_cell(cell.parent.pathfinder, character.cell.indexX, character.cell.indexY);

character.cell = cell;
cell.unit = character;
character.x = cell.centerX;
character.y = cell.centerY;
mp_grid_add_instances(cell.parent.pathfinder, character, false);

return global.RETURN_OK;

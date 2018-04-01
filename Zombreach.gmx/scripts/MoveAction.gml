character = argument0;
cell = argument1;

if(instance_exists(cell.unit))
    return global.UNIT_EXISTS; // Can't move to an occupied cell
if(!RangeCheck(character.cell, cell, character.movement, global.RANGE_MANHATTAN) )
    return global.OUT_OF_RANGE; // Tring to move too far

character.x = cell.centerX;
character.y = cell.centerY;
character.cell = cell;

return global.RETURN_OK;

character = argument0;
targetCell = argument1;

weapon = character.weapon;
if(!RangeCheck(character.cell, targetCell, weapon.range, weapon.rangeType))
    return global.OUT_OF_RANGE;

unit = targetCell.unit
if(instance_exists(unit))
    unit.hp -= weapon.damage;
else
    show_debug_message("AttackAction : targeted an empty cell");

return global.RETURN_OK;


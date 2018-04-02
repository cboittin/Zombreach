var character = argument0;
var targetCell = argument1;

var weapon = character.weapon;
if(!RangeCheck(character.cell, targetCell, weapon.range, weapon.rangeType))
    return global.OUT_OF_RANGE;

var unit = targetCell.unit
if(instance_exists(unit))
    DealDamage(character, unit, weapon.damage);
else
    show_debug_message("AttackAction : targeted an empty cell");

return global.RETURN_OK;


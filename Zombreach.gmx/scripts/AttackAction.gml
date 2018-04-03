var character = argument0;
var targetCell = argument1;

var weapon = character.weapon;
if(!RangeCheck(character.cell, targetCell, weapon.range, weapon.rangeType))
    return global.OUT_OF_RANGE;

TriggerHit(character, targetCell, weapon.damage);
return global.RETURN_OK;


var character = argument0;
var targetCell = argument1;
var state = argument2;

if(character.hasAttacked == true) {
    return global.RETURN_ERROR;
}

var weapon = character.weapon;
if(!RangeCheck(character.cell, targetCell, weapon.range, weapon.rangeType))
    return global.OUT_OF_RANGE;

var damage = weapon.damage;
if(weapon.weaponType & global.WEAPON_USE_STRENGTH)
    damage += character.strength;
TriggerHit(character, targetCell, damage);
character.hasAttacked = true;
ActionEnd(state);
return global.RETURN_OK;


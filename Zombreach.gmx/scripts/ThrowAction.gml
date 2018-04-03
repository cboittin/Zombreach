var character = argument0;
var targetCell = argument1;

if(!character.weapon.weaponType & global.WEAPON_THROWABLE)
    return global.RETURN_ERROR;

if(!RangeCheck(character.cell, targetCell, character.strength + 3, global.RANGE_MANHATTAN))
    return global.OUT_OF_RANGE;

TriggerHit(character, targetCell, character.weapon.damage);
instance_destroy(character.weapon);
character.weapon = instance_create(0, 0, Fist);
character.weapon.character = character;


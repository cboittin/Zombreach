var character = argument0;
var targetCell = argument1;
var state = argument2;

if(character.hasAttacked == true)
    return global.RETURN_ERROR;

if(!character.weapon.weaponType & global.WEAPON_THROWABLE)
    return global.RETURN_ERROR;

if(!RangeCheck(character.cell, targetCell, character.strength + 3, global.RANGE_MANHATTAN))
    return global.OUT_OF_RANGE;

TriggerHit(character, targetCell, character.weapon.damage + character.strength);
instance_destroy(character.weapon);
character.weapon = instance_create(0, 0, Fist);
character.weapon.character = character;
character.hasAttacked = true;

// Noise
character.cell.noise += 1;
targetCell.noise += weapon.noise;
state.noise += weapon.noise + 1;

ActionEnd(state);
return global.RETURN_OK;


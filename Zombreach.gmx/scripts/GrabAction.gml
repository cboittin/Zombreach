var state = argument0;

var character = state.activeCharacter;
var cell = character.cell;
var prop = cell.prop;

if(!instance_exists(prop) || !(prop.propType & global.PROP_GRABBABLE) )
    return global.RETURN_ERROR;

if(prop.propType & global.PROP_WEAPON) {
    instance_destroy(character.weapon);
    character.weapon = prop.weapon;
    character.weapon.visible = true;
    character.weapon.character = character;
    instance_destroy(prop);
} else
    AddProp(state.party, prop);

// instance_destroy(prop) FIXME we probably have some kind of resources as props, which will need to get destroyed
cell.prop = noone;

// Activate throw action if available
InitializeActionMenu(state);

// Noise
state.noise += 1;
cell.noise += 1;

ActionEnd(state);
return global.RETURN_OK;


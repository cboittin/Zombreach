var state = argument0;
var actionMenu = state.actionMenu;

var activeCharacter = state.activeCharacter;
var cell = activeCharacter.cell;
var prop = cell.prop;

actionMenu.activeAction = actionMenu.moveAction;
// Move action
if(activeCharacter.canMove == true) {
    actionMenu.moveAction.disabled = false;
    actionMenu.moveAction.active = true;
} else {
    actionMenu.moveAction.disabled = true;
    actionMenu.activeAction = noone;
    actionMenu.moveAction.active = false;
}
// Attack action
if(activeCharacter.canAttack == true)
    actionMenu.attackAction.disabled = false;
else
    actionMenu.attackAction.disabled = true;
// Throw action
if(activeCharacter.weapon.weaponType & global.WEAPON_THROWABLE)
    actionMenu.throwAction.disabled = false;
else
    actionMenu.throwAction.disabled = true;
// Grab action
if(instance_exists(prop) && (prop.propType & global.PROP_GRABBABLE))
    actionMenu.grabAction.disabled = false;
else
    actionMenu.grabAction.disabled = true;
// Special action
if(instance_exists(prop) && (prop.propType & global.PROP_USABLE))
    actionMenu.specialAction.disabled = false;
else
    actionMenu.specialAction.disabled = true;
// Pass action
actionMenu.passAction.disabled = false;

actionMenu.attackAction.active = false;
actionMenu.throwAction.active = false;
actionMenu.grabAction.active = false;
actionMenu.specialAction.active = false;
actionMenu.passAction.active = false;

/*
// Reset the previous state of the actionmenu
var i;
for(i = 0; i < ds_list_size(actionMenu.actions); i += 1) {
    instance_destroy(ds_list_find_value(actionMenu.actions, i));
}
ds_list_clear(actionMenu.actions);


var characterActions = activeCharacter.actions;
var prop = activeCharacter.cell.prop;

var nActions = ds_list_size(characterActions);
if(instance_exists(prop) && object_exists(prop.action)) {
    nActions += 1;
}
if(activeCharacter.weapon.weaponType & global.WEAPON_THROWABLE) {
    nActions += 1;
}

var actionsY = actionMenu.y;
var xStep = 310 / (nActions + 1);
var actionsX = 0;

for(i = 0; i < ds_list_size(characterActions); i += 1) {
    actionObject = ds_list_find_value(activeCharacter.actions, i);
    actionButton = instance_create(actionsX + i * xStep, actionsY, actionObject);
    ds_list_insert(actionMenu.actions, i, actionButton);
    actionButton.actionPanel = actionMenu;
}
if(instance_exists(prop) && object_exists(prop.action)) {
    actionButton = instance_create(actionsX + i * xStep, actionsY + 2, prop.action);
    ds_list_insert(actionMenu.actions, i, actionButton);
    actionButton.actionPanel = actionMenu;
}
if(activeCharacter.weapon.weaponType & global.WEAPON_THROWABLE) {
    actionButton = instance_create(actionsX + i * xStep, actionsY + 2, Throw);
    ds_list_insert(actionMenu.actions, i, actionButton);
    actionButton.actionPanel = actionMenu;
}*/


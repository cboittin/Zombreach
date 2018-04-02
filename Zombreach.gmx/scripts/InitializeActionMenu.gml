var state = argument0;
var actionMenu = state.actionMenu;

// Reset the previous state of the actionmenu
var i;
for(i = 0; i < ds_list_size(actionMenu.actions); i += 1) {
    instance_destroy(ds_list_find_value(actionMenu.actions, i));
}
ds_list_clear(actionMenu.actions);

var activeCharacter = state.activeCharacter;

var characterActions = activeCharacter.actions;
var prop = activeCharacter.cell.prop;

var nActions = ds_list_size(characterActions);
if(instance_exists(prop) && object_exists(prop.action)) {
    nActions += 1;
}

var actionsY = actionMenu.y + 40;
var xStep = 310 / (nActions + 1);
var actionsX = xStep;

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


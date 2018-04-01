actionMenu = argument0;
state = argument1;

activeCharacter = state.activeCharacter;

nActions = ds_list_size(activeCharacter.actions);
actionsY = actionMenu.y + 40;
xStep = 310 / (nActions + 1);
actionsX = xStep;

for(var i = 0; i < nActions; i += 1) {
    actionObject = ds_list_find_value(activeCharacter.actions, i);
    actionButton = instance_create(actionsX + i * xStep, actionsY, actionObject);
    ds_list_insert(actionMenu.actions, i, actionButton);
    actionButton.actionPanel = actionMenu;
}


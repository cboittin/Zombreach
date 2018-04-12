var state = argument0;

allDead = true;
for(var i = 0; i < ds_list_size(state.npcs); i += 1) {
    if(state.npcs[| i].dead == false)
        allDead = false;
}
if(allDead == true) {
    TriggerEndFight(state);
}


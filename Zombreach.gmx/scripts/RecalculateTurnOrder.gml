var state = argument0;
var turnOrder = state.turnOrder;
var initialUnits = turnOrder.currentUnits;

// Add any missing units to the turn order
var i;
for(i = 0; i < 4; i += 1) {
    var character = state.party.characters[i];
    if(instance_exists(character) && is_undefined(ds_map_find_value(initialUnits, character)) ) {
        ds_map_add(initialUnits, character, character.initiative);
    }
}
for(i = 0; i < ds_list_size(state.npcs); i += 1) {
    var npc = ds_list_find_value(state.npcs, i);
    if(npc.dead == false && is_undefined(ds_map_find_value(initialUnits, npc))) {
        ds_map_add(initialUnits, npc, npc.initiative);
    }
}

// Find the active unit for each turn, and update each unit's initiative
var turnOrderState = ds_map_create();
ds_map_copy(turnOrderState, initialUnits);
var picks = ds_list_create();
for(i = 0; i < global.TURN_ORDER_SLOTS; i += 1) {
    var cur = ds_map_find_first(turnOrderState);
    var pick = cur;
    while(!is_undefined(cur)) {
        var init = turnOrderState[? cur];
        if(init > turnOrderState[? pick])
            pick = cur;
        ds_map_replace(turnOrderState, cur, init + cur.initiative);
        cur = ds_map_find_next(turnOrderState, cur);
    }
    ds_map_replace(turnOrderState, pick, 0);
    ds_list_add(picks, pick);
}
ds_map_destroy(turnOrder.finalUnits);
turnOrder.finalUnits = turnOrderState;

// Update the turn order
for(i = 0; i < ds_list_size(turnOrder.slots); i += 1) {
    instance_destroy(turnOrder.slots[| i]);
}
ds_list_clear(turnOrder.slots);
for(i = 0; i < ds_list_size(picks); i += 1) {
    var portrait = instance_create(0, 0, TurnOrderPortrait);
    portrait.unit = picks[| i];
    ds_list_add(turnOrder.slots, portrait);
}

ds_list_destroy(picks);


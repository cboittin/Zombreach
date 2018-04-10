var state = argument0;
var turnOrder = state.turnOrder;

instance_destroy( turnOrder.slots[| 0] );
ds_list_delete(turnOrder.slots, 0);

var turnOrderState = turnOrder.finalUnits;
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

var unit = turnOrder.slots[| 0].unit;
var portrait = instance_create(0, 0, TurnOrderPortrait);
portrait.unit = unit;
ds_list_add(turnOrder.slots, portrait);

return unit;


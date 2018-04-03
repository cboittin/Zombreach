var initiator = argument0;
var targetCell = argument1;
var damage = argument2;

var unit = targetCell.unit;
if(instance_exists(unit))
    DealDamage(initiator, unit, damage);
else
    show_debug_message("TriggerHit : targeted an empty cell");


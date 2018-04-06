var cell = argument0;
var state = argument1.state;

var character = state.activeCharacter;
if(!instance_exists(state.activeCharacter))
    return 0;
var activeAction = state.actionMenu.activeAction;
var returnValue = noone;

switch(activeAction.actionName) {
case "move":
    returnValue = MoveAction(character, cell, state);
    break;
case "attack":
    returnValue = AttackAction(character, cell);
    break;
case "throw":
    returnValue = ThrowAction(character, cell);
    break;
case "special":
    returnValue = SpecialAction(character, cell);
    break;
default:
    show_debug_message("CellClicked : action not recognized");
}

if(returnValue == global.RETURN_OK)
    NextCharacter(state);
else {
    switch(returnValue) {
    case noone: break;
    case global.RETURN_ERROR:
        show_debug_message("CellClicked : action invalid");
        break;
    case global.OUT_OF_RANGE:
        show_debug_message("CellClicked : out of range");
        break;
    default:
    }
}


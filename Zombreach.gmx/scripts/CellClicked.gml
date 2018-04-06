var cell = argument0;
var state = argument1.state;

var character = state.activeCharacter;
if(!instance_exists(state.activeCharacter))
    return global.RETURN_ERROR;
    
var activeAction = state.actionMenu.activeAction;
if(activeAction == noone)
    return global.RETURN_ERROR;

var returnValue = noone;
switch(activeAction.actionName) {
case "move":
    returnValue = MoveAction(character, cell, state);
    break;
case "attack":
    returnValue = AttackAction(character, cell, state);
    break;
case "throw":
    returnValue = ThrowAction(character, cell, state);
    break;
case "special":
    returnValue = SpecialAction(character, cell, state);
    break;
default:
    show_debug_message("CellClicked : action not recognized");
}

if(returnValue != global.RETURN_OK) {
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


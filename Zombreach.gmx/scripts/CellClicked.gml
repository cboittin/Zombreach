var cell = argument0;
var state = argument1.state;

var character = state.activeCharacter;
if(!instance_exists(state.activeCharacter))
    return 0;
var activeAction = state.actionMenu.activeAction;
var returnValue = noone;
if(!instance_exists(activeAction)) {
    returnValue = MoveAction(character, cell);
} else {
    switch(activeAction) {
    case "attack":
        returnValue = AttackAction(character, cell);
        break;
    default:
        show_debug_message("CellClicked : action not recognized");
    }
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


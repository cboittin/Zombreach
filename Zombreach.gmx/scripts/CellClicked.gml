cell = argument0;
state = argument1.state;

character = state.activeCharacter;
activeAction = state.actionMenu.activeAction;
returnValue = noone;
if(!instance_exists(activeAction)) {
    returnValue = MoveAction(character, cell);
} else {
    switch(activeAction) {
    case "attack":
        returnValue = AttackAction(character, cell.unit);
        break;
    default:
        show_debug_message("CellClicked : action not recognized");
    }
}

if(returnValue == global.RETURN_OK)
    NextCharacter(state);
else
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

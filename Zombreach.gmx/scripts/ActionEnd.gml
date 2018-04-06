var state = argument0;
var character = state.activeCharacter;

if(character.hasMoved && character.hasAttacked) {
    NextCharacter(state);
} else {
    if(character.hasMoved == true) {
        state.actionsMenu.moveAction.active = false;
        state.actionsMenu.moveAction.disabled = true;
        if(state.actionsMenu.attackAction.disabled == false) {
            state.actionsMenu.activeAction = self.actionsMenu.attackAction;
            state.actionsMenu.attackAction.active = true;
        }
    }
    if(character.hasAttacked == true) {
        state.actionsMenu.attackAction.active = false;
        state.actionsMenu.attackAction.disabled = true;
        if(state.actionsMenu.moveAction.disabled == false) {
            state.actionsMenu.activeAction = self.actionsMenu.moveAction;
            state.actionsMenu.moveAction.active = true;
        }
        if(state.actionsMenu.throwAction.disabled == false) {
            state.actionsMenu.throwAction.disabled = true;
        }
    }
}

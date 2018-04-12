var state = argument0;
var character = state.activeCharacter;

CheckEndFight(state);

if(character.hasMoved && character.hasAttacked)
    NextCharacter(state); // We moved and attacked, switch to next character
else {
    var actionMenu = state.actionMenu;
    
    // We probably just moved, switch to attack as default action, if available
    if(character.hasMoved) {
        actionMenu.activeAction = noone;
        actionMenu.moveAction.active = false;
        actionMenu.moveAction.disabled = true;
        
        var attackAction = actionMenu.attackAction;
        if(attackAction.disabled == false) {
            actionMenu.activeAction = attackAction;
            attackAction.active = true;
        }
    }
    
    // We probably just attacked, switch to move as default action, if available
    if(character.hasAttacked) {
        actionMenu.activeAction = noone;
        actionMenu.attackAction.active = false;
        actionMenu.attackAction.disabled = true;
        actionMenu.throwAction.disabled = true;
        var moveAction = actionMenu.moveAction;
        if(moveAction.disabled == false) {
            actionMenu.activeAction = moveAction;
            moveAction.active = true;
        }
    }
}


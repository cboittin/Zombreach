var state = argument0;

var currentCharacter = state.activeCharacter;
if(currentCharacter != noone)
    currentCharacter.active = false;
state.activeCharacter = noone;
/*do {
    state.activeCharacterIndex += 1;
    if(state.activeCharacterIndex >= state.nActiveChars) {
        return EndOfTurn(state);
    } else {
        state.activeCharacter = state.party.characters[state.activeCharacterIndex];
    }
} until(state.activeCharacter.dead == false);
state.activeCharacter.active = true;
state.actionMenu.activeAction = noone;
*/

var nextActive = UpdateTurnOrder(state);
if(nextActive.characterType == global.CH_PLAYABLE) {
    TurnBegin(state, nextActive);
} else {
    PlayNPC(state, nextActive);
}


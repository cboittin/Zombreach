var state = argument0;

state.activeCharacter.active = false;
state.activeCharacter = noone;
do {
    state.activeCharacterIndex += 1;
    if(state.activeCharacterIndex >= state.nActiveChars) {
        return EndOfTurn(state);
    } else {
        state.activeCharacter = state.party.characters[state.activeCharacterIndex];
    }
} until(state.activeCharacter.dead == false);
state.activeCharacter.active = true;
state.actionMenu.activeAction = noone;

InitializeActionMenu(state);


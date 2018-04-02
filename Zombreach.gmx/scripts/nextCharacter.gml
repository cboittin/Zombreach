var state = argument0;

state.activeCharacter.active = false;
state.activeCharacter = noone;
state.activeCharacterIndex += 1;
if(state.activeCharacterIndex >= state.nActiveChars) {
    EndOfTurn(state);
} else {
    state.activeCharacter =  state.party.characters[state.activeCharacterIndex];
}
state.activeCharacter.active = true;
state.actionMenu.activeAction = noone;

InitializeActionMenu(state);


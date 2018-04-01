state = argument0;

state.activeCharacter.active = false;
state.activeCharacterIndex += 1;
if(state.activeCharacterIndex >= state.nActiveChars) {
    state.activeCharacter = state.party.characters[0];
    state.activeCharacterIndex = 0;
} else {
    state.activeCharacter =  state.party.characters[state.activeCharacterIndex];
}
state.activeCharacter.active = true;
state.actionMenu.activeAction = noone;


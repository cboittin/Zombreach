var state = argument0;

var currentCharacter = state.activeCharacter;
if(currentCharacter != noone)
    currentCharacter.active = false;
state.activeCharacter = noone;
/* OLD VERSION - WITHOUT INITIATIVE AND DYNAMIC TURN ORDER
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
*/

// Noise update
for(var i = 0; i < global.GRID_WIDTH; i +=1) {
    for(var j = 0; j < global.GRID_HEIGHT; j += 1) {
        var cell = state.grid.cells[i, j];
        if(cell.noise > 0) {
            cell.noise -= 1;
            state.noise -= 1;
        }
    }
}

var nextActive = UpdateTurnOrder(state);
if(nextActive.characterType == global.CH_PLAYABLE) {
    TurnBegin(state, nextActive);
} else {
    PlayNPC(state, nextActive);
}


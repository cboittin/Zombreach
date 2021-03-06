var state = argument0;

CalculateNoise(state);
//PlayNPCs(state);

for(var i = 0; i < ds_list_size(state.npcs); i += 1) {
    var npc = ds_list_find_value(state.npcs, i);
    if(npc.characterType == global.CH_ZOMBIE) {
        if(npc.isDown && !npc.dead ) {
            npc.hp = max(1, npc.hp);
            npc.isDown = false;
        }
    }
}

for(i = 0; i < state.party.nCharacters; i += 1) {
    state.party.characters[i].hasMoved = false;
    state.party.characters[i].hasAttacked = false;
}

state.activeCharacterIndex = 0;
state.activeCharacter = state.party.characters[0];
while(state.activeCharacter.dead == true) {
    state.activeCharacterIndex += 1;
    state.activeCharacter = state.party.characters[state.activeCharacterIndex];
    if(state.activeCharacterIndex > state.nActiveChars)
        return global.RETURN_ERROR;
}
state.activeCharacter.active = true;
InitializeActionMenu(state);
return global.RETURN_OK;

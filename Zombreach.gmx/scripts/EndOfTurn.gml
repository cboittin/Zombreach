var state = argument0;

CalculateNoise(state);
PlayNPCs(state);

for(var i = 0; i < ds_list_size(state.npcs); i += 1) {
    var npc = ds_list_find_value(state.npcs, i);
    if(npc.characterType == global.CH_ZOMBIE) {
        if(npc.isDown && !npc.dead ) {
            npc.hp = 1;
            npc.isDown = false;
        }
    }
}

state.activeCharacter = state.party.characters[0];
state.activeCharacterIndex = 0;
InitializeActionMenu(state);


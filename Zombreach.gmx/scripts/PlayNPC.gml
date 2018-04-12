var state = argument0;
var npc = argument1;
var noiseGrid = state.noiseGrid;

if(npc.isDown == true && npc.dead == false) {
    npc.hp = max(1, npc.hp);
    npc.isDown = false;
} else {
    // TODO Play npc
    
}

NextCharacter(state);


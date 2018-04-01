state = argument0;
areaInfo = argument1;
grid = state.grid;
party = state.party;

startX = round(global.GRID_WIDTH / 4);
startY = round(global.GRID_HEIGHT * .66);
diffY = global.GRID_HEIGHT - startY;
if(diffY mod 2 == 1) {
    startY += 1;
    diffY -= 1;
}

enemyX = floor(global.GRID_WIDTH / 2);
diffX = global.GRID_WIDTH - enemyX;

// Initialize player positions
var i;
var positions = ds_list_create();
for(i = 0; i < state.nActiveChars; i += 1) {
    charX = irandom(startX - 1);
    charY = floor(diffY / 2) + irandom(startY - 1);
    while(ds_list_find_index(positions, charY) != -1)
        charY = diffY + irandom(startY - 1);
    ds_list_add(positions, charY);
    SpawnCharacterInFight(party.characters[i], grid, charX, charY);
}
ds_list_destroy(positions);

// Initialize enemies positions
var positionsX = ds_list_create();
var positionsY = ds_list_create();
show_debug_message("nZombies " + string(areaInfo.nZombies));
for(i = 0; i < areaInfo.nZombies; i += 1) {
    zX = diffX + irandom(enemyX - 1);
    zY = irandom(global.GRID_HEIGHT - 1);
    while(ds_list_find_index(positionsX, zX) != -1 && ds_list_find_index(positionsY, zY) != -1) {
        zX = diffX + irandom(enemyX - 1);
        zY = irandom(global.GRID_HEIGHT - 1);
    }
    ds_list_add(positionsX, zX);
    ds_list_add(positionsY, zY);
    zombie = instance_create(0, 0, Zombie);
    SpawnCharacterInFight(zombie, grid, zX, zY);
}
ds_list_destroy(positionsX);
ds_list_destroy(positionsY);


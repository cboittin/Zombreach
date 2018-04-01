state = argument0;
areaInfo = argument1;
grid = state.grid;
party = state.party;

GRID_WIDTH = grid.GRID_WIDTH;
GRID_HEIGHT = grid.GRID_HEIGHT;

startX = round(GRID_WIDTH / 4);
startY = round(GRID_HEIGHT * .66);
diffY = GRID_HEIGHT - startY;
if(diffY mod 2 == 1) {
    startY += 1;
    diffY -= 1;
}

enemyX = floor(GRID_WIDTH / 2);
diffX = GRID_WIDTH - enemyX;

// Initialize player positions
var i;
var positions = ds_list_create();
for(i = 0; i < state.nActiveChars; i += 1) {
    charX = irandom(startX - 1);
    charY = floor(diffY / 2) + irandom(startY - 1);
    while(ds_list_find_index(positions, charY) != -1)
        charY = diffY + irandom(startY - 1);
    ds_list_add(positions, charY);
    cell = grid.cells[charX, charY]
    cell.unit = party.characters[i];
    cell.unit.x = cell.centerX;
    cell.unit.y = cell.centerY;
    cell.unit.cell = cell;
}
ds_list_destroy(positions);

// Initialize enemies positions
var positionsX = ds_list_create();
var positionsY = ds_list_create();
show_debug_message("nZombies " + string(areaInfo.nZombies));
for(i = 0; i < areaInfo.nZombies; i += 1) {
    zX = diffX + irandom(enemyX - 1);
    zY = irandom(GRID_HEIGHT - 1);
    while(ds_list_find_index(positionsX, zX) != -1 && ds_list_find_index(positionsY, zY) != -1) {
        zX = diffX + irandom(enemyX - 1);
        zY = irandom(GRID_HEIGHT - 1);
    }
    ds_list_add(positionsX, zX);
    ds_list_add(positionsY, zY);
    cell = grid.cells[zX, zY]
    cell.unit = instance_create(cell.centerX, cell.centerY, Zombie)
}
ds_list_destroy(positionsX);
ds_list_destroy(positionsY);


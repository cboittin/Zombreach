var state = argument0;
var areaInfo = argument1;
var grid = state.grid;
var party = state.party;

var startX = round(global.GRID_WIDTH / 4);
var startY = round(global.GRID_HEIGHT * .66);
var diffY = global.GRID_HEIGHT - startY;
if(diffY mod 2 == 1) {
    startY += 1;
    diffY -= 1;
}

var enemyX = floor(global.GRID_WIDTH / 2);
var diffX = global.GRID_WIDTH - enemyX;

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
ds_list_clear(positions);

// Initialize enemies positions
show_debug_message("nZombies " + string(areaInfo.nZombies));
for(i = 0; i < areaInfo.nZombies; i += 1) {
    var zX, xY;
    var valid = false;
    while(!valid) {
        zX = diffX + irandom(enemyX - 1);
        zY = irandom(global.GRID_HEIGHT - 1);
        valid = true;
        
        for(var j = 0; j < ds_list_size(positions); j += 1) {
            var tupCheck = ds_list_find_value(positions, j);
            if(zX == tupCheck[0] && zY == tupCheck[1]) {
                valid = false;
                break;
            }
        }
    }
    AddTuple(positions, zX, zY);
    var zombie = instance_create(0, 0, Zombie);
    SpawnCharacterInFight(zombie, grid, zX, zY);
    ds_list_add(state.npcs, zombie);
}
ds_list_clear(positions);

// Initialize props
for(i = 0; i < areaInfo.nProps; i += 1) {
    var prop = GenerateProp();
    
    var xMin = 0;
    var xMax = global.GRID_WIDTH - 1
    var yMin = 0;
    var yMax = global.GRID_HEIGHT - 1;
    if(prop.occupiedCells & global.CELL_RIGHT)
        xMax -= 1;
    if(prop.occupiedCells & global.CELL_LEFT)
        xMin += 1;
    if(prop.occupiedCells & global.CELL_BOTTOM)
        yMax -= 1;
    if(prop.occupiedCells & global.CELL_TOP)
        yMin += 1;
    
    var pX;
    var pY;
    var valid = false;
    while(!valid) {
        pX = xMin + irandom(xMax - xMin);
        pY = yMin + irandom(yMax - yMin);
        valid = true;
        
        for(var j = 0; j < ds_list_size(positions); j += 1) {
            var tupCheck = ds_list_find_value(positions, j);
            if(pX == tupCheck[0] && pY == tupCheck[1]) {
                valid = false;
                break;
            }
        }
    }
    
    AddTuple(positions, pX, pY);
    
    if(prop.occupiedCells & global.CELL_RIGHT) 
        AddTuple(positions, pX + 1, pY);
    if(prop.occupiedCells & global.CELL_LEFT)
        AddTuple(positions, pX - 1, pY);
    if(prop.occupiedCells & global.CELL_BOTTOM)
        AddTuple(positions, pX, pY + 1);
    if(prop.occupiedCells & global.CELL_TOP)
        AddTuple(positions, pX, pY - 1);
    
    SpawnProp(prop, grid, pX, pY);
}
ds_list_destroy(positions);


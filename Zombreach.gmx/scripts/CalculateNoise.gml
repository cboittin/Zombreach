var state = argument0;
var grid = state.grid;

instance_destroy(state.noiseGrid);
noise = instance_create(0, 0, Noise);
state.noiseGrid = noise;

for(var i = 0; i < global.GRID_WIDTH; i += 1) {
    for(var j = 0; j < global.GRID_HEIGHT; j += 1) {
        var cell = grid.cells[i, j];
        noise.cells[i, j] = cell.noise;
        if(cell.unit != noone)
            noise.cells[i, j] += cell.unit.noise;
        // TODO prop noise
    }
}


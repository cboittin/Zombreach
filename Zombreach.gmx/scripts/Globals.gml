// Colors
global.yOutline[0] = 0.8;
global.yOutline[1] = 0.8;
global.yOutline[2] = 0;
global.yOutline[3] = 1;

global.rOutline[0] = 0.8;
global.rOutline[1] = 0;
global.rOutline[2] = 0;
global.rOutline[3] = 1;

// Constants
global.GRID_WIDTH = 8;
global.GRID_HEIGHT = 8;
global.CELL_SIZE = 35;

// Status checks
global.RETURN_OK = 0;
global.RETURN_ERROR = 1;
global.UNIT_EXISTS = -1;
global.OUT_OF_RANGE = -2;

// Range checks
global.RANGE_MANHATTAN = 1;
global.RANGE_LINE = 2;
global.RANGE_JUMP_1 = 4;
global.RANGE_DISTANCE = global.RANGE_MANHATTAN | global.RANGE_LINE | global.RANGE_JUMP_1;
global.RANGE_MELEE = 8;
global.RANGE_SELF = 16;
global.RANGE_SQUARE = 32;

// Character types
global.CH_PLAYABLE = 0;
global.CH_ZOMBIE = 1;
global.CH_NPC_ALLY = 2;
global.CH_NPC_ENEMY = 3;


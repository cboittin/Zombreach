// Fonts
global.pixelFont = font_add("Pixel_Font.ttf", 24, false, false, 32, 128);

// Colors
global.yOutline[0] = 0.9;
global.yOutline[1] = 0.9;
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
global.TURN_ORDER_SLOTS = 10;

// Status checks
global.RETURN_OK = 0;
global.RETURN_ERROR = 1;
global.RETURN_UNAVAILABLE = 2;
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

// Event types
global.EVENT_MOVEMENT = 0;
global.EVENT_MOVEMENT_LOUD = 1;
global.EVENT_ATTACK = 2;
global.EVENT_ATTACK_LOUD = 3;
global.EVENT_GUNFIRE = 4;
global.EVENT_BREAK = 5;
global.EVENT_BREAK_LOUD = 6;
global.EVENT_ACTION = 7;
global.EVENT_ACTION8LOUD = 8;

// Prop types
global.PROP_WEAPON = 1;
global.PROP_COLLECTIBLE = 2;
global.PROP_FURNITURE = 4;
global.PROP_USABLE = 8;

global.PROP_DESTRUCTIBLE = global.PROP_FURNITURE;
global.PROP_GRABBABLE = global.PROP_WEAPON | global.PROP_COLLECTIBLE;

// Cells
global.CELL_TOP = 1;
global.CELL_LEFT = 2;
global.CELL_RIGHT = 4;
global.CELL_BOTTOM = 8;

// Weapon types
global.WEAPON_REGULAR = 0;
global.WEAPON_FIST = 1;
global.WEAPON_THROWABLE = 2;
global.WEAPON_USE_AMMO = 4;
global.WEAPON_USE_STRENGTH = 8;


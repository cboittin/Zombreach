var state = argument0;
var character = argument1;

state.activeCharacter = character;
character.active = true;
character.hasMoved = false;
character.hasAttacked = false;
InitializeActionMenu(state);


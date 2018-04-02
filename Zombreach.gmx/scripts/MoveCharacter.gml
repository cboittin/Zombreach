var character = argument0;
var destination = argument1;

var origin = character.cell;
origin.unit = noone;
character.cell = destination;
destination.unit = character;
character.x = destination.centerX;
character.y = destination.centerY;
/*
CalculateNoise(origin);
CalculateNoise(destination);
*/


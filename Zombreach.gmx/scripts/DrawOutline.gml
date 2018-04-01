sprite = argument0;
outlineColor = argument1;
outlineSize = argument2;
sx = argument3;
sy = argument4;

//Draw the sprite 1 pixel off in each direction
draw_sprite_ext(sprite, -1, sx - outlineSize, sy - outlineSize, 1, 1, 0, outlineColor, 1);
draw_sprite_ext(sprite, -1, sx + outlineSize, sy - outlineSize, 1, 1, 0, outlineColor, 1);
draw_sprite_ext(sprite, -1, sx - outlineSize, sy + outlineSize, 1, 1, 0, outlineColor, 1);
draw_sprite_ext(sprite, -1, sx + outlineSize, sy + outlineSize, 1, 1, 0, outlineColor, 1);


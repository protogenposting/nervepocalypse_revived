/// @description Insert description here
// You can write your code in this editor




draw_sprite_ext(sprite_index,0,x,y,1,1,0,color,1)
var oldcol=draw_get_color()
draw_set_color(color)
draw_rectangle(x-3,y,x+3,y-len,false)
draw_set_color(oldcol)
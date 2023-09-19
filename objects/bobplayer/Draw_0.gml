/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(gun1,image_index,x,y+lengthdir_y(6,direction),0.4,-sign((x-mouse_x)-0.5)*0.4,direction,c_white,1)
drawing=!drawing
if(i<=0||drawing)
{
	draw_sprite_ext(sprite_index,image_index,x,y,-sign((x-mouse_x)-0.5),1,0,c_white,1)
}
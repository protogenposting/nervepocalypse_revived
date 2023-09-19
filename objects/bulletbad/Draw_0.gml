/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,c_red,1)
draw_set_alpha(speed/20)
draw_line(xstart,ystart,xstart+(hspeed*2000),ystart+(vspeed*2000))
draw_set_alpha(1)
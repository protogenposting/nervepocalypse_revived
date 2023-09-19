/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,-sign((x-bobplayer.x)-0.5),1,0,c_white,1)
draw_healthbar(x-32,y-64-16,x+32,y-64,(hp/mhp)*100,c_black,c_red,c_red,0,true,false)
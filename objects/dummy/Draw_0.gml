/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x,y,image_xscale*-sign(x-player.x),image_yscale,0,c_white,1)
draw_healthbar(x-64,y-128-32,x+64,y-128,(hp/mhp)*100,c_black,c_red,c_red,0,true,false)
draw_text(x-64,y-128-32,"dps: "+string(-dps))
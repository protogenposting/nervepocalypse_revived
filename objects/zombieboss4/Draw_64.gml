/// @description Insert description here
// You can write your code in this editor
draw_healthbar((view_wport[0]/2)-256,0,(view_hport[0]/2)+256,64,(hp/mhp)*100,c_black,c_red,c_red,0,true,false)
draw_text((view_wport[0]/2)-256,0,string(hp)+"/"+string(mhp))
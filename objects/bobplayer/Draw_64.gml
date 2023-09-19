/// @description Insert description here
// You can write your code in this editor
draw_healthbar(0,0,256,64,(hp/mhp)*100,c_black,c_red,c_red,0,true,false)
draw_text(0,0,string(hp)+"/"+string(mhp))
draw_text(0,96,"score: "+string(scorey))
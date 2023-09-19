/// @description Insert description here
// You can write your code in this editor
draw_healthbar(0,0,256,64,(hp/mhp)*100,c_black,c_red,c_red,0,true,false)
draw_text(0,64,"score: "+string(stats.scorey))
draw_text(0,96,"money: "+string(stats.money))

var ecs=0
var why=128
var num=0
repeat(array_length(ammos))
{
	draw_rectangle(ecs,why,ecs+64,why+64,ammonum==num)
	draw_rectangle(ecs,why,ecs+64,why+64,true)
	draw_sprite(object_get_sprite(ammos[num]),0,ecs+32,why+32)
	ecs+=64
	num+=1
}
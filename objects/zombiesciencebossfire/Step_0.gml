/// @description Insert description here
// You can write your code in this editor
targdir=point_direction(x,y,player.x,player.y)
if(hp<=0)
{
	instance_destroy()
}
if(fire)
{
	effect_create_above(ef_smoke,x,bbox_top,1,c_red)
	hp-=0.01
}
direction=targdir
speed=7
if(alarm[1]>0)
{
	speed=0
	effect_create_below(ef_cloud,x,y,1,c_orange)
}
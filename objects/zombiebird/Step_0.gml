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
	targdir=irandom(360)
}
direction+=angle_difference(targdir,direction)/20
speed=5
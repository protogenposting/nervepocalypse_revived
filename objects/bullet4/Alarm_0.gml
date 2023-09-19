/// @description Insert description here
// You can write your code in this editor

if(instance_exists(zombie))
{
circling=false
speed=10
inst=instance_nearest(player.x,player.y,zombie)
direction=point_direction(x,y,inst.x,inst.y)
}
else
{
	alarm[0]=60
}
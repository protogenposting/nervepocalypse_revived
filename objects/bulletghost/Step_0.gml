/// @description Insert description here
// You can write your code in this editor
if(instance_exists(zombie)&&attacking)
{
if(distance_to_object(zombie)<256)
{
	speed=5
}
else
{
	speed+=0.25
}
inst=instance_nearest(player.x,player.y,zombie)
image_xscale=sign(x-inst.x)
direction=point_direction(x,y,inst.x,inst.y)
}
else
{
	speed*=0.99
}
image_angle=vspeed*hspeed
/// @description Insert description here
// You can write your code in this editor
speed*=0.9
if(instance_exists(zombie))
{
	inst=instance_nearest(x,y,zombie)
	image_angle-=(image_angle-point_direction(x,y,inst.x,inst.y))/10
	image_yscale=sign((inst.x>x)-0.5)
}
x=player.x
y=player.y-128
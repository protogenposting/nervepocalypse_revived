/// @description Insert description here
// You can write your code in this editor
if(alarm[0]>0&&instance_exists(zombie))
{
	speed*=0.9
	direction-=(direction-point_direction(x,y,zombie.x,zombie.y))/30
}
image_angle=direction+360
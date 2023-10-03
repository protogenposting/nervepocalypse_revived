/// @description Insert description here
// You can write your code in this editor
image_angle=direction
if(!instance_exists(zombie))
{
	speed-=0.01
}
if(instance_exists(zombie))
{
	speed+=0.001
}
damage=distance_to_object(player)/(room_width/3)
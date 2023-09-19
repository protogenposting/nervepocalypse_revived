/// @description Insert description here
// You can write your code in this editor
with(zombie)
{
	var diryo=point_direction(x,y,other.x,other.y)
	if(distance_to_object(other)>=32)
	{
		hsp+=lengthdir_x(100/distance_to_object(other),diryo)
		vsp+=lengthdir_y(100/distance_to_object(other),diryo)
	}
}
with(player)
{
	var diryo=point_direction(x,y,other.x,other.y)
	if(distance_to_object(other)>=32)
	{
		hsp+=lengthdir_x(100/distance_to_object(other),diryo)
		vsp+=lengthdir_y(100/distance_to_object(other),diryo)
	}
}
hspeed+=random_range(-0.1,0.1)
vspeed+=random_range(-0.1,0.1)

if(abs(hspeed)>4)
{
	hspeed*=0.9
}
if(abs(vspeed)>4)
{
	vspeed*=0.9
}
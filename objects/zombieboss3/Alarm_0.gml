/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(player)<=512)
{
	vsp=-15
	y-=grav
	repeat(5)
	{
		inst=instance_create_depth(x,y,depth,bulletbad)
		inst.direction=irandom(360)
	}
}
alarm[0]=60
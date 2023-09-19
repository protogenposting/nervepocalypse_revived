/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(player)<=512)
{
	inst=instance_create_depth(x,y,depth,bulletbad)
	inst.direction=rot
	rot+=45+random_range(-25,25)
}
alarm[0]=5
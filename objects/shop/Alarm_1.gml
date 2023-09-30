/// @description Insert description here
// You can write your code in this editor

if(instance_exists(zombie))
{
	inst=instance_create_depth(x,y,depth-1,bullet8)
	inst2=instance_nearest(x,y,zombie)
	inst.direction=point_direction(x,y,inst2.x,inst2.y)
	inst.speed=50
	if(inst2.object_index==dummy)
	{
		instance_destroy(inst)
	}
}
alarm[1]=1
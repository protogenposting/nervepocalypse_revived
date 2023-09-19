/// @description Insert description here
// You can write your code in this editor
if(instance_exists(zombie))
{
	inst=instance_nearest(x,y,zombie)
	inst2=instance_furthest(x,y,zombie)
	insty=instance_create_depth(x,y,depth,bullet24)
	insty.direction=point_direction(x,y,inst.x,inst.y)
	insty.alarm[0]=-4
	insty.speed=speed
	insty.col=c_blue
	insty=instance_create_depth(x,y,depth,bullet24)
	insty.direction=point_direction(x,y,inst2.x,inst2.y)
	insty.alarm[0]=-4
	insty.speed=speed
	insty.col=c_green
	insty=instance_create_depth(x,y,depth,bullet24)
	insty.direction=direction
	insty.alarm[0]=-4
	insty.speed=speed
	insty.col=c_red
}
else
{
	speed*=2
}
instance_destroy()
/// @description Insert description here
// You can write your code in this editor




ecs=ecs-room_width
repeat(room_width/128)
{
	inst=instance_create_depth(ecs,room_height,depth-1,fireprojectile)
	inst.vspeed=-10
	ecs+=128
}
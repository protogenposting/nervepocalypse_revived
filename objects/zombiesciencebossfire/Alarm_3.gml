/// @description Insert description here
// You can write your code in this editor
if(hp<=mhp*0.90)
{
	ecs=irandom(128)
	repeat(room_width/128)
	{
		inst=instance_create_depth(ecs,room_height-32,depth-1,zdraw)
		ecs+=128
		alarm[4]=60
	}
}
alarm[3]=360
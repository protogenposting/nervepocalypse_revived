/// @description Insert description here
// You can write your code in this editor
inst=instance_create_depth(irandom(room_width),irandom(room_height),depth,bot)
with(inst)
{
	while(distance_to_object(player)<=128||place_meeting(x,y,wall))
	{
		x=irandom(room_width)
		y=irandom(room_height)
	}
	if(instance_number(bot)>35)
	{
		instance_destroy()
	}
}
alarm[1]=15
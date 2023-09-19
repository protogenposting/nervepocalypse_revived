/// @description Insert description here
// You can write your code in this editor


if(!rung)
{
	image_indexy=0
}
else
{
	image_indexy=image_index
}
vspeed=rung*2
if(y>room_height)
{
	audio_stop_sound(shoptheme)
	instance_destroy(shop)
	instance_destroy()
}
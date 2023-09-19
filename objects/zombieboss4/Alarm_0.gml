/// @description Insert description here
// You can write your code in this editor
vsp=15
y-=grav
repeat(irandom_range(5,15))
{
	instance_create_depth(irandom(room_width),0,0,firefall)
}
alarm[0]=360
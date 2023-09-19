/// @description Insert description here
// You can write your code in this editor
repeat(5)
{
	inst=instance_create_depth(x+lengthdir_x(128,direction),y+lengthdir_y(128,direction),0,player.ammo)
	inst.direction=direction+irandom_range(-45,45)
	inst.speed=speed*2
	inst.image_angle=inst.direction
}
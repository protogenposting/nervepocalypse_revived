/// @description Insert description here
// You can write your code in this editor
repeat(2)
{
	inst=instance_create_depth(x,y,0,player.ammo)
	inst.direction=direction+random_range(0,360)
	inst.speed=speed*2
	inst.image_angle=inst.direction
}
/// @description Insert description here
// You can write your code in this editor
image_angle=direction
if(dest&&instance_exists(zombie)&&distance_to_object(zombie)<512)
{
	direction+=angle_difference(point_direction(x,y,zombie.x,zombie.y),direction)/10
}
if(image_xscale<=0)
{
	instance_destroy()
}
if(sprite_index==mushcloud)
{
	image_xscale-=0.01
	image_yscale-=0.01
}
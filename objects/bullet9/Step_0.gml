/// @description Insert description here
// You can write your code in this 
image_angle=direction
image_yscale=1
while(direction>360)
{
	direction-=360
}
if(direction<=90&&direction>=270)
{
	image_yscale=-1
}
if(target==-1)
{
	direction+=random_range(-5,5)
	speed*=random_range(0.99,1.01)
}
else
{
	if(!instance_exists(target)||target.hp<=0)
	{
		instance_destroy()
	}
	direction+=angle_difference(point_direction(x,y,target.x,target.y),direction)/5
}
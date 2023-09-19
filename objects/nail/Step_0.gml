/// @description Insert description here
// You can write your code in this editor




if(instance_exists(zombie))
{
	if(distance_to_object(player)>256&&alarm[0]<=0)
	{
		var inst=instance_nearest(x,y,zombie)
		if(instance_exists(inst))
		{
			direction+=angle_difference(point_direction(x,y,inst.x,inst.y),direction)/5
			if(angle_difference(point_direction(x,y,inst.x,inst.y),direction)<=0.5)
			{
				speed=stspeed
			}
			else
			{
				speed=stspeed/(angle_difference(point_direction(x,y,inst.x,inst.y),direction)/5)
			}
		}
	}
}
image_angle=direction
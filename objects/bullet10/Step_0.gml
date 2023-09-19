/// @description Insert description here
// You can write your code in this editor
if(instance_number(bullet10)>10&&hp>=mhp)
{
	instance_destroy()
}
if(hp<=0)
{
	effect_create_above(ef_explosion,x,y,1,c_red)
	instance_destroy()
}
vspeed+=1
image_angle=direction
if(instance_exists(zombie))
{
inst=instance_nearest(player.x,player.y,zombie)
if(inst.x>x+64)
{
	if(hspeed<40)
	{
		hspeed+=0.9
	}
}
else if(inst.x<x-64)
{
	if(hspeed>-40)
	{
		hspeed-=0.9
	}
}
}
else
{
	inst=player
	if(inst.x>x+64)
	{
		if(hspeed<40)
		{
			hspeed+=0.9
		}
	}
	else if(inst.x<x-64)
	{
		if(hspeed>-40)
		{
			hspeed-=0.9
		}
	}
}
if(place_meeting(x+hspeed,y,wall))
{
    while(!place_meeting(x+sign(hspeed),y,wall))
    {
        x += sign(hspeed)
    }
    hspeed*= -1
}
if(place_meeting(x,y+vspeed,wall))
{
    while(!place_meeting(x,y+sign(vspeed),wall))
    {
        y += sign(vspeed)
    }
    if(vspeed>=20)
    {
    //put stuff for long falls here
    }
    vspeed *= -1
}
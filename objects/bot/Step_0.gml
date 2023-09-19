/// @description Insert description here
// You can write your code in this editor
if(hp<=0)
{
	bobplayer.scorey+=mhp
	if(irandom(10)>=7)
	{
		instance_create_depth(x,y,depth,lootcrate)
	}
	instance_destroy()
}
speed=movespd
var diry=point_direction(x,y,bobplayer.x,bobplayer.y)
if(collision_line(x,y,bobplayer.x,bobplayer.y,wall,true,true)||distance_to_object(bobplayer)>=128*bobplayer.movespd)
{
	direction+=1
}
else
{
	direction=point_direction(x,y,bobplayer.x,bobplayer.y)
}
if(place_meeting(x+hspeed,y,wall))
{
    while(!place_meeting(x+sign(hspeed),y,wall))
    {
        x += sign(hspeed)
    }
    hspeed=0
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
    vspeed =0
}
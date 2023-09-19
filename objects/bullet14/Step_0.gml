/// @description Insert description here
// You can write your code in this editor
image_angle=(hspeed*vspeed)
if(place_meeting(x,y-64,wall)||y<room_height/1.5)
{
	instance_destroy()
}
if(place_meeting(x+hspeed,y,wall))
{
    while(!place_meeting(x+sign(hspeed),y,wall))
    {
        x += sign(hspeed)
    }
    hspeed*=-0.9
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
    vspeed = 0
	hspeed=0
	if(alarm[0]<=0)
	{
		alarm[0]=120
	}
}
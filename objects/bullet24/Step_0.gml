/// @description Insert description here
// You can write your code in this editor
vspeed+=0.1
image_angle+=hspeed*2

if(place_meeting(x+hspeed,y,wall))
{
    while(!place_meeting(x+sign(hspeed),y,wall))
    {
        x += sign(hspeed)
    }
    hspeed *= -1
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
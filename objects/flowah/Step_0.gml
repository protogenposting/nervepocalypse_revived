 /// @description Insert description here
// You can write your code in this editor
vspeed+=0.25

image_angle=direction
hspeed*=0.9
image_xscale-=0.01
image_yscale-=0.01

if(image_xscale<=0)
{
	instance_destroy()
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
    vspeed = 0
}
if(instance_exists(shop))
{
	instance_destroy()
}
/// @description Insert description here
// You can write your code in this editor
if(hp<=0)
{
	instance_destroy()
}
if(fire)
{
	effect_create_above(ef_smoke,x,bbox_top,1,c_red)
	hp-=0.01
}
if(player.x>x+64)
{
	if(hsp<movespd)
	{
		hsp+=fric
	}
}
else if(player.x<x-64)
{
	if(hsp>-movespd)
	{
		hsp-=fric
	}
}
vsp+=grav
if(place_meeting(x,y+1,wall))
{
	vsp=-vsp
}
if(place_meeting(x+hsp,y,wall))
{
    while(!place_meeting(x+sign(hsp),y,wall))
    {
        x += sign(hsp)
    }
    hsp=0
}
x+=hsp
if(place_meeting(x,y+vsp,wall))
{
    while(!place_meeting(x,y+sign(vsp),wall))
    {
        y += sign(vsp)
    }
    if(vsp>=20)
    {
    //put stuff for long falls here
    }
    vsp = 0
}
y+=vsp
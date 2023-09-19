/// @description Insert description here
// You can write your code in this editor
if(hp<=0)
{
	menuthing.finalbossdefeated=true
	instance_destroy()
}
var nummy=instance_number(zhand)
if(!instance_exists(zhand))
{
	repeat(4)
	{
		inst=instance_create_depth(x,y,depth,zhand)
		inst.handid=nummy
	}
}

hsp=lengthdir_x(movespd,point_direction(x,y,player.x,player.y))
vsp=lengthdir_y(movespd,point_direction(x,y,player.x,player.y))
if(x<0)
{
	x=room_width
}
if(x>room_width)
{
	x=0
}	
if(y<0)
{
	y=room_height
}
if(y>room_height)
{
	y=0
}
x+=hsp
y+=vsp
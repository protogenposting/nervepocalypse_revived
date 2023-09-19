/// @description Insert description here
// You can write your code in this 

image_index=handid
rot+=5
iy[0]-=1
if(hp<=0||!instance_exists(zombiebossfinal))
{
	instance_destroy()
}
if(state==0)
{
	hsp=lengthdir_x(movespd,point_direction(x,y,zombiebossfinal.x+(handid-2*256),zombiebossfinal.y))
	vsp=lengthdir_y(movespd,point_direction(x,y,zombiebossfinal.x+(handid-2*256),zombiebossfinal.y))
}
if(state==1)
{
	hsp=lengthdir_x(movespd,point_direction(x,y,player.x,player.y))
	vsp=lengthdir_y(movespd,point_direction(x,y,player.x,player.y))
}
if(state==2)
{
	hsp=0
	vsp=0
	x=(player.x+lengthdir_x(1024*2,rot))
	y=(player.y+lengthdir_y(1024*2,rot))
	if(iy[0]<=0)
	{
		inst=instance_create_depth(x,y,depth,bulletbadlaser)
		inst.direction=point_direction(x,y,player.x,player.y)
		iy[0]=60
	}
}
if(state==3)
{
	hsp=lengthdir_x(movespd,point_direction(x,y,zombiebossfinal.x+(sign(handid-0.5)*256),zombiebossfinal.y))
	vsp=lengthdir_y(movespd,point_direction(x,y,zombiebossfinal.x+(sign(handid-0.5)*256),zombiebossfinal.y))
	inst=instance_create_depth(x,y,depth,bulletbadlaser)
	inst.direction=point_direction(x,y,player.x,player.y)
}
x+=hsp
y+=vsp
	
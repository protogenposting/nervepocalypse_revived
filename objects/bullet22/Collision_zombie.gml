/// @description Insert description here
// You can write your code in this editor
if(targ==-1)
{
	targ=other
}
if(other==targ)
{
	if(hspeed!=0&&alarm[0]<=0)
	{
		other.hp-=2*damage
		vspeed=-2
		hspeed=0
		stspd=other.movespd
		other.hsp=0
		other.movespd=0
		y=other.bbox_top-6
		x=other.x
		alarm[0]=2
	}
	if(hspeed==0&&alarm[0]<=0)
	{
		vspeed=-2
		other.movespd=stspd
		targ=-1
	}
}
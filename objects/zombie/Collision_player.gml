/// @description Insert description here
// You can write your code in this editor




if(menuthing.skin==4&&menuthing.skineffectactive&&abs(other.hsp)>other.movespd+1)
{
	hp-=1
	hsp=other.hsp+sign(hsp)
	vsp-=20
	y-=grav
}
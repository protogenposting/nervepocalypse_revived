/// @description Insert description here
// You can write your code in this editor
if(i[0]<=0)
{
	hp-=((scorey/1000)+1)*menuthing.zombiedamagemult[menuthing.difficulty]
	deathcause="zombie"
	i[0]=120
	bouncy=true
	alarm[7]=60*9
	menuthing.acheivment5=true
	vsp=-12
	y-=grav
}
if(vsp>=40)
	{
		other.hp-=10
		vsp=-20
		other.image_yscale*=0.9
		other.movespd*=0.5
		menuthing.acheivment18=true
	}
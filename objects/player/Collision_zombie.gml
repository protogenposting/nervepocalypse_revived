/// @description Insert description here
// You can write your code in this editor
if(i[0]<=0)
{
	deathcause="zombie"
	hp-=menuthing.zombiedamagemult[menuthing.difficulty]
	i[0]=120	
}
if(vsp>=40)
	{
		other.hp-=10
		vsp=-20
		other.image_yscale*=0.9
		other.movespd*=0.5
	}
menuthing.acheivment17num+=1
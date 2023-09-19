/// @description Insert description here
// You can write your code in this editor
other.hp-=1
other.hsp*=-1
if(other.hp<=0)
{
	inst=instance_create_depth(other.x,other.y,other.depth,hypnozombie)
	if(instance_exists(inst))
	{
		inst.mhp=hp/2
		inst.hp=hp/2
	}
}
hp-=1
if(y<other.bbox_top+5)
{
	effect_create_above(ef_firework,x,y,0.2,c_red)
	other.hsp*=2
}
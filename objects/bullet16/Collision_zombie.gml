/// @description Insert description here
// You can write your code in this editor
other.hp-=1*damage
if(other.hp<=0)
{
	inst=instance_create_depth(other.x,other.y,other.depth,hypnozombie)
	if(instance_exists(inst))
	{
		inst.mhp=other.mhp/2
		inst.hp=other.mhp/2
	}
}
instance_destroy()
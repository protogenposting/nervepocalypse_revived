/// @description Insert description here
// You can write your code in this editor
with(zombie)
{
	if(object_index!=dummy)
	{
		instance_destroy()
	}
}
if(fire)
{
	effect_create_above(ef_smoke,x,bbox_top,1,c_red)
	hp-=0.01
}
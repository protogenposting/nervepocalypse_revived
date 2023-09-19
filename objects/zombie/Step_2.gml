/// @description Insert description here
// You can write your code in this editor




if(alarm[11]>0)
{
	x=xprevious
	image_xscale*=-1
}
else
{
	image_xscale=1
}
if(variable_instance_exists(id,"hpold"))
{
	hpold-=(hpold-hp)/10
}
else
{
	hpold=hp
}
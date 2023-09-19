/// @description Insert description here
// You can write your code in this editor
image_xscale-=0.1
image_yscale-=0.1
other.hp-=0.1*damage
with(zombie)
{
	if(distance_to_object(other)<128)
	{
		hp-=0.05
	}
}
dest=true
x=xprevious
y=yprevious
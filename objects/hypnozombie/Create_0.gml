/// @description Insert description here
// You can write your code in this editor
vsp=0
hsp=0
movespd=5
grav=1
jsp=15
fric=0.6

i[0]=10

hp=10
mhp=10

fire=false

if(instance_exists(zombie))
{
	target=instance_nearest(player.x,player.y,zombie)
}
if(instance_number(hypnozombie)>10)
{
	instance_destroy()
}
/// @description Insert description here
// You can write your code in this editor
vsp=0
hsp=0
movespd=5
grav=1
jsp=7
fric=0.3

i[0]=10

hp=10000
mhp=10000

fire=false

image_xscale=2
image_yscale=2
alarm[0]=60
var num=0
repeat(4)
{
	inst=instance_create_depth(x,y,depth,zhand)
	inst.handid=num
	num+=1
}
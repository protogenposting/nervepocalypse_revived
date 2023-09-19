/// @description Insert description here
// You can write your code in this editor




repeat(5)
{
	inst=instance_create_depth(x,y,depth,bulletbad)
	inst.direction=irandom(360)
	inst.speed=-5
}
if(irandom(1)!=1)
{
	alarm[1]=120
}
else
{
	alarm[0]=120
}
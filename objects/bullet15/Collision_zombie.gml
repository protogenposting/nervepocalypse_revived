/// @description Insert description here
// You can write your code in this editor
if(instance_exists(zombie))
{
	other.hp-=damage
	inst=instance_furthest(x,y,zombie)
	direction=point_direction(x,y,inst.x,inst.y)
	speed+=1
}
else
{
	inst=player
	direction=point_direction(x,y,inst.x,inst.y)
	speed+=1
}
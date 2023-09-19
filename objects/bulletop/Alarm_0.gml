/// @description Insert description here
// You can write your code in this editor
if(instance_exists(zombie))
{
inst=instance_create_depth(x,y,0,player.ammos[irandom(array_length(player.ammos)-1)])
insty=instance_nearest(player.x,player.y,zombie)
inst.direction=point_direction(x,y,insty.x,insty.y)
inst.speed=10
}
alarm[0]=120
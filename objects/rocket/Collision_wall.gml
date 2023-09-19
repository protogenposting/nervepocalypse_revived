/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(player)<=128)
{
	player.vsp=lengthdir_y(1,direction+180)*60
	player.hsp=lengthdir_x(1,direction+180)*60
	player.y-=player.grav
}
instance_destroy()
/// @description Insert description here
// You can write your code in this editor
x-=(x-player.x)/60
y-=(y-player.y)/60
if(player.hp<=0)
{
	player.hp+=1
	instance_destroy()
}
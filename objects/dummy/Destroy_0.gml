/// @description Insert description here
// You can write your code in this editor
if(instance_exists(multiplayer))
{
	//stats.scorey+=mhp
	//stats.money+=mhp/2
}
else
{
	player.scorey+=mhp
	player.money+=mhp/2
}
effect_create_above(ef_firework,x,y,1,c_red)
if(irandom(29)==29)
{
	instance_create_depth(x,y,1,healthrestore)
}
menuthing.kills+=1
if(distance_to_object(player)>64*20)
{
	menuthing.acheivment13=true
}
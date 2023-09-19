/// @description Insert description here
// You can write your code in this editor
if(instance_exists(multiplayer))
{
	//stats.scorey+=mhp
	//stats.money+=mhp/2
}
else
{
	player.money+=mhp*2
}
effect_create_above(ef_firework,x,y,1,c_red)
if(irandom(29)>=18)
{
	instance_create_depth(x,y,1,healthrestore)
}
audio_sound_set_track_position(player.audtheme,0)
menuthing.bossdead=true
menuthing.bossesdead+=1
repeat(random_range(1,5))
{
	instance_create_depth(x+random_range(-32,32),y+random_range(-32,32),1,doge)
}
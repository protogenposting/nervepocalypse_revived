/// @description Insert description here
// You can write your code in this editor
other.hp-=0.05*damage
effect_create_above(ef_explosion,x,y,1,c_black)
with(zombie)
{
	if(distance_to_object(other)<128)
	{
		hp-=0.05*other.damage
	}
}
audio_play_sound(BEWM,1000,false)
dest=true
speed=speed+10
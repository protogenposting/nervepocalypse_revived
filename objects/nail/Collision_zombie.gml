/// @description Insert description here
// You can write your code in this editor
effect_create_above(ef_explosion,x,y,0.5,c_red)
other.hp-=damage
audio_play_sound(BEWM,1000,false)
with(zombie)
{
	if(distance_to_object(other)<=64)
	{
		hp-=other.damage*0.25
	}
}
instance_destroy()
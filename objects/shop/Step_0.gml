/// @description Insert description here
// You can write your code in this editor
if(!place_meeting(x,y,wall))
{
	vspeed+=0.25
}
else
{
	if(vspeed>0)
	{
		instance_create_depth(x+256,y,depth,wavebell)
		audio_play_sound(BEWM,1000,false)
	}
	vspeed=0
}
image_xscale=-sign(x-player.x)
player.alarm[0]=360
player.alarm[6]=360
player.alarm[5]=360
if(place_meeting(x,y,player)&&vspeed==0)
{
	playertouched=true
}
if(instance_exists(wavebell)&&wavebell.rung)
{
	audio_sound_gain(aud,0,120)
	rungy=true
	vspeed=-25
}
if(rungy&&y<=0)
{
	audio_stop_sound(shoptheme)
	instance_destroy()
}

var beatlen=60/bpm

if(audio_sound_get_track_position(aud)>nbeat)
{
	nbeat+=beatlen
	image_index+=1
}
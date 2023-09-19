/// @description Insert description here
// You can write your code in this editor

if(menuthing.difficulty<5)
{
	audio_play_sound(eventtheme,1000,false)
	var evsel=irandom(array_length(event)-1)
	eval=1
	evtext=event[evsel].name
	event[evsel].func()
	alarm[6]=60*15
	if(menuthing.difficulty>3)
	{
		alarm[6]=60*10
	}
	if(menuthing.difficulty>4)
	{
		alarm[6]=60*4
	}
}
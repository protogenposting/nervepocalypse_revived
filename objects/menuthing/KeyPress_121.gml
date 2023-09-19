/// @description Insert description here
// You can write your code in this editor




global.languageselected+=1
if(global.languageselected>4)
{
	global.languageselected=0
}
show_message(global.languages[global.languageselected])
audio_stop_all()
instance_destroy()
room_restart()
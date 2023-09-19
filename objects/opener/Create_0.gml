/// @description Insert description here
// You can write your code in this editor
randomize()
audio_stop_all()
if(room==introwo)
{
	vid=choose("intro.mp4","intro2.mp4")
}
video_open(vid);
alarm[0]=(video_get_duration()/1000)*60
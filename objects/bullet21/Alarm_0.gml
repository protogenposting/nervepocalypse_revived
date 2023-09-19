/// @description Insert description here
// You can write your code in this editor
inst=instance_create_depth(x,y,depth,player.ammo)
inst.direction=image_angle
inst.speed=25
inst.image_angle=image_angle
audio_play_sound(riflefire,1000,false)
alarm[0]=15
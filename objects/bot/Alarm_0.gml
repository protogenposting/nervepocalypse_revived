/// @description Insert description here
// You can write your code in this editor
if(mhp>=15&&!collision_line(x,y,bobplayer.x,bobplayer.y,wall,true,true)&&distance_to_object(bobplayer)<128*bobplayer.movespd)
{
	inst=instance_create_depth(x,y,depth,bulletbadlaser)
	inst.direction=irandom(360)
}
alarm[0]=30
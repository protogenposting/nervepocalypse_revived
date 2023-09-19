/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(zombiebossfinal))
{
	var num=0
	repeat(array_length(bossesfought))
	{
		if(array_length(bossesfought)-3<num)
		{
			array_push(bossesfought,false)
		}
		if(scorey>=((num+0.5)*bossmult)&&!bossesfought[num])
		{
			inst=instance_create_depth(choose(256,room_width-256),room_height/2,depth,bosses[irandom_range(0,array_length(bosses)-1)])
			inst.hp+=scorey/10
			inst.mhp+=scorey/10
			audio_sound_set_track_position(audboss,0)
			bossesfought[num]=true
			bossmult+=bossmult
		}
		num+=1
	}
}
alarm[5]=360
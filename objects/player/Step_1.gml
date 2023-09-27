/// @description Insert description here
// You can write your code in this editor
lvsp=vsp
if(gamepad_is_connected(0))
{
	window_mouse_set(window_mouse_get_x()+(gamepad_axis_value(0,gp_axisrh)*25), window_mouse_get_y()+(gamepad_axis_value(0,gp_axisrv)*25));
}
if(scorey>=10000&&!instance_exists(zombiebossfinal)&&!menuthing.finalbossdefeated)
{
	instance_create_depth(x,0,depth,zombiebossfinal)
}
var num=0
repeat(array_length(ammos))
{
	with(ammos[num])
	{
		if(x<0)
		{
			instance_destroy()
		}
		if(x>room_width)
		{
			instance_destroy()
		}
		if(y<0)
		{
			instance_destroy()
		}
		if(y>room_height)
		{
			instance_destroy()
		}
	}
	num+=1
}
if(y<0)
{
	hp-=1
}
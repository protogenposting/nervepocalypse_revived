/// @description Insert description here
// You can write your code in this editor
if(hp<=0)
{
	if(scorey>menuthing.bvbhs)
	{
		menuthing.bvbhs=scorey
	}
	with(menuthing)
		{
			save_level()
		}
		with(all)
		{
			if(persistent==true)
			{
				instance_destroy()
			}
		}
		audio_stop_all()
		room_goto(menu)
}
i-=1
guni-=1
if(dodgekey)
{
	dodge=true
	alarm[0]=15
	i=15
	chsp=hsp
	cvsp=vsp
	dodgekey=false
}
gamepad_set_axis_deadzone(0,0.1)
if(dodge)
{
	hsp=chsp*3
	vsp=cvsp*3
}
else
{
	shoot = mouse_check_button(mb_left)||gamepad_button_check(0,gp_shoulderrb)
	sneakkey = keyboard_check(vk_shift)||gamepad_button_check(0,gp_shoulderlb)
	leftKey = keyboard_check(ord("A"))||keyboard_check(vk_left)||gamepad_axis_value(0,gp_axislh)<0
	rightKey = keyboard_check(ord("D"))||keyboard_check(vk_right)||gamepad_axis_value(0,gp_axislh)>0
	upKey = keyboard_check(ord("W"))||keyboard_check(vk_up)||gamepad_axis_value(0,gp_axislv)<0
	downKey = keyboard_check(ord("S"))||keyboard_check(vk_down)||gamepad_axis_value(0,gp_axislv)>0
	dodgekey = mouse_check_button_pressed(mb_right)||gamepad_button_check(0,gp_shoulderl)
	hsp=(rightKey-leftKey)*movespd
	vsp=(downKey-upKey)*movespd
}
if(shoot&&guni<=0)
{
	inst=instance_create_depth(x,y,depth,ammo)
	inst.speed=15
	inst.direction=direction
	guni=gunreload
	inst.image_angle=direction
	inst.image_xscale=0.5
	inst.image_yscale=0.5
	audio_play_sound(riflefire,100,false)
}
if(guni>0)
{
	hsp=0
	vsp=0
}
if(sneakkey)
{
	movespd=1
}
else
{
	movespd=3
}
direction=point_direction(x,y,mouse_x,mouse_y)
if(place_meeting(x+hsp,y,wall))
		{
		    while(!place_meeting(x+sign(hsp),y,wall))
		    {
		        x += sign(hsp)
		    }
			hsp=0
		}
		x+=hsp
		if(place_meeting(x,y+vsp,wall))
		{
		    while(!place_meeting(x,y+sign(vsp),wall))
		    {
		        y += sign(vsp)
		    }
		    if(vsp>=20)
		    {
		    //put stuff for long falls here
		    }
			vsp = 0
		}
		y+=vsp
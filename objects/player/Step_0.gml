/// @description Insert description here
// You can write your code in this editor
	i[0]-=1
	i[1]-=1
	i[2]-=1
	i[3]-=1
	if(supply[7].bought)
	{
		grav=1
	}
	if(menuthing.difficulty>=5)
	{
		movespd=7.5*1.5
	}
	if(i[0]>0&&supply[9].bought)
	{
		inst=instance_create_depth(irandom(room_width),128,depth,bullet25)
		inst.vspeed=10
	}
	if(hp>0)
	{
		if(supply[6].bought&&!instance_exists(shop))
		{
			hp+=(mhp/60)/600
		}
		if(supply[16].bought&&!instance_exists(shop)&&i[1]<=0)
		{
			hp+=hp/30000
		}
		if(abs(vsp)>100)
		{
			vsp*=0.5
		}
		if(x<0||x>room_width||y<-256||y>room_height)
		{
			x=xstart
			y=ystart
		}
		if(y<0)
		{
			menuthing.acheivment15=true
			vsp=0
		}
		stilltime+=1
		if(abs(hsp)>0.1||abs(vsp)>0.1)
		{
			stilltime=0
			show_debug_message([hsp,vsp])
			show_debug_message(stilltime)
		}
		if(fire)
		{
			hp-=0.001
		}
		var bossexists=false
		var num=0
		repeat(array_length(bosses))
		{
			if(instance_exists(bosses[num]))
			{
				bossexists=true
			}
			num+=1
		}
		if(instance_exists(zombiebossfinal)||instance_exists(zombiesciencebossfire))
		{
			bossexists=true
		}

		if(bossexists)
		{
			if(menuthing.idlethemes[menuthing.musictheme]==bossattackproot)
			{
				bpm=180
			}
			audio_sound_gain(audtheme,0,120)
			audio_sound_gain(audboss,1,120)
			currenttheme=audboss
		}
		if(!bossexists)
		{
			if(menuthing.idlethemes[menuthing.musictheme]==themeproot)
			{
				bpm=160
			}
			audio_sound_gain(audtheme,1,120)
			audio_sound_gain(audboss,0,120)
			currenttheme=audtheme
		}
		if(audio_is_playing(eventtheme)||audio_is_playing(shoptheme)||audio_is_playing(sciencetheme))
		{
			audio_sound_gain(audtheme,0,30)
			audio_sound_gain(audboss,0,30)
		}
		gamepad_set_axis_deadzone(0,0.1)
		_input = {left: keyboard_check(ord("A"))||keyboard_check(vk_left)||gamepad_axis_value(0,gp_axislh)<0,
		        right: keyboard_check(ord("D"))||keyboard_check(vk_right)||gamepad_axis_value(0,gp_axislh)>0,
		        up: keyboard_check(vk_space)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_face1),
				glide: keyboard_check(ord("E"))||gamepad_button_check(0,gp_shoulderlb),
		        mb_x: m_axisx,
		        mb_y: m_axisy,
		        fire: mouse_check_button(mb_left)||gamepad_button_check(0,gp_shoulderrb),
				firereleased: mouse_check_button_released(mb_left)||gamepad_button_check_released(0,gp_shoulderrb),
				lunge: mouse_check_button_pressed(mb_right)||gamepad_button_check_pressed(0,gp_face2),
				lungehold: mouse_check_button(mb_right)||gamepad_button_check(0,gp_face2),
				dash: keyboard_check_pressed(vk_shift),
				pound: keyboard_check_pressed(ord("S"))||gamepad_button_check(0,gp_face3)}
		lkey=_input.left
		rkey=_input.right
		jkey=_input.up
		hkey=_input.glide
		dkey=_input.dash
		pkey=_input.pound
		if(supply[5].bought&&jkey)
		{
			vsp-=grav*2
		}
		if(!gamepad_button_check_pressed(0,gp_face4)&&gamepad_button_check_pressed(0,gp_shoulderr)||!gamepad_button_check_pressed(0,gp_face4)&&gamepad_button_check_pressed(0,gp_shoulderl))
		{
			melee=!melee
		}
		if(rolling)
		{
			player.i[1]=30
			hsp=sign(phsp)*movespd*3
			_input = {left: false,
		        right: false,
		        up: keyboard_check(vk_space)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_face1),
				glide: false,
		        mb_x: m_axisx,
		        mb_y: m_axisy,
		        fire: false,
				firereleased: false,
				lunge: false,
				lungehold: false,
				dash: false,
				pound: false}
		}
		if(_input.lunge&&(menuthing.skin!=2&&menuthing.skin!=3&&menuthing.skin!=4&&menuthing.skin!=5)||_input.lunge&&!menuthing.skineffectactive)
		{
			phsp=-sign(x-mouse_x)
			vsp=-jsp*0.75
			y-=grav
			player.i[0]=35
			rolling=true
			hsp+=-sign(x-mouse_x)*movespd*1.5
			rolling=true
			alarm[4]=30
		}
		lkey=_input.left
		rkey=_input.right
		jkey=_input.up
		hkey=_input.glide
		dkey=_input.dash
		pkey=_input.pound
		if(auto)
		{
			i[0]=60
			hp=mhp
			_input.fire=true
			if(instance_exists(wavebell))
			{
				wavebell.rung=true
			}
		}
		if(_input.fire&&!melee)
		{
			gun[gunselected].func(ammo)
		}
		if(gunselected==3&&player._input.firereleased)
		{
			gun[gunselected].func(ammo)
		}
		if(_input.fire&&melee&&player.i[1]<0)
		{
			player.i[1]=30
			if(supply[12].bought)
			{
				player.i[1]=15
			}
			hit=false
			image_index_real=0
		}
		airtime+=1
		if(pkey&&supply[4].bought)
		{
			vsp=40
		}
		if(kb>0)
		{
			kb-=1
		}
		if(lkey)
		{
			if(hsp>-movespd)
			{
				hsp-=movespd*fric
			}
		}
		else if(rkey)
		{
			if(hsp<movespd)
			{
				hsp+=movespd*fric
			}
		}
		if(!lkey&&!rkey&&vsp==0||vsp==0&&abs(hsp)>movespd&&menuthing.skin!=4||!menuthing.skineffectactive&&vsp==0&&abs(hsp)>movespd)
		{
			hsp*=fric
		}
		if(hsp!=0)
		{
			image_xscale=sign(hsp)
		}
		if(menuthing.skineffectactive)
		{
			skineff[menuthing.skin]()
		}
		if(place_meeting(x,y+grav,wall)&&!bouncy||collision_point(x,y+(grav*sprite_get_height(sprite_index)/2),invisiwall,true,true)&&abs(vsp)>=0&&!bouncy)
		{
			airtime=0
			if(menuthing.floorislava&&!instance_exists(shop))
			{
				deathcause="lava"
				hp-=0.01
			}
			hangglider=false
			if(vsp>0)
			{
				global.p1 = part_type_create();
				part_type_shape(global.p1, pt_shape_square);
				part_type_size(global.p1, 0.01, 0.1, 0, 0);
				part_type_scale(global.p1, 1, 1);
				part_type_colour1(global.p1, c_dkgray);
				part_type_alpha2(global.p1, 1, 1);
				part_type_speed(global.p1, 2, 4, 0, 0);
				part_type_direction(global.p1, 0,  180, 0, 0);
				part_type_gravity(global.p1, 0.20, 270);
				part_type_orientation(global.p1, 0, 0, 0, 0, 1);
				part_type_blend(global.p1, 1);
				part_type_life(global.p1, 15, 60);
				var ind=part_system_create()
				part_particles_create(ind, x, bbox_bottom, global.p1, 10);
				}
				if(hsp*sign(hsp)>0.5)
				{
					global.p1 = part_type_create();
					part_type_shape(global.p1, pt_shape_square);
					part_type_size(global.p1, 0.01, 0.1, 0, 0);
					part_type_scale(global.p1, 1, 1);
					part_type_colour1(global.p1, c_dkgray);
					part_type_alpha2(global.p1, 1, 1);
					part_type_speed(global.p1, 2, 4, 0, 0);
					part_type_direction(global.p1, point_direction(x,bbox_bottom,x-hsp,y)-15,  point_direction(x,bbox_bottom,x-hsp,y)-180, 0, 0);
					part_type_gravity(global.p1, 0.20, 270);
					part_type_orientation(global.p1, 0, 0, 0, 0, 1);
					part_type_blend(global.p1, 1);
					part_type_life(global.p1, 15, 60);
					var ind=part_system_create()
					part_particles_create(ind, x, bbox_bottom, global.p1, 2);
				}
				vsp=0
				if(jkey)
				{
					vsp=-jsp*grav
				}
				if(hkey)
				{
					vsp=-jsp*1.3
				}
		}
		else
		{
			if(!hangglider&&vsp<20||vsp<1)
			{
				vsp+=abs(grav-(hangglider*0.5))*grav
				if(supply[5].bought)
				{
					hsp+=sign(hsp)/10
				}
			}
			hangglider=hkey
		}

		image_yscale=1
		if(!hitting)
		{
		if(place_meeting(x+hsp,y,wall))
		{
		    while(!place_meeting(x+sign(hsp),y,wall))
		    {
		        x += sign(hsp)
		    }
			if(bouncy)
			{
				hsp*=-1.3
			}
			else
			{
				hsp=0
			}
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
			if(bouncy)
			{
				vsp*=-1.3
			}
			else
			{
				vsp = 0
				if(menuthing.floorislava&&!instance_exists(shop))
				{
					deathcause="lava"
					hp-=0.01
				}
			}
		}
		y+=vsp
		}
		if(!rolling)
		{
			if(!melee&&abs(hsp)>movespd&&(menuthing.skin!=4||!menuthing.skineffectactive))
			{
				hsp*=0.7
			}
			if(abs(hsp)>1000)
			{
				hsp=0
			}
		}
		if(abs(vsp)>200)
		{
			vsp*=0.1
		}

		if(bullet_number()>menuthing.maxproj)
		{
			destroy_bullets(bullet_number()-menuthing.maxproj,menuthing.maxproj)
		}
		if(melee&&!instance_exists(bullet21)&&extragun)
		{
			instance_create_depth(x,y,depth,bullet21)
		}
		else if(!melee)
		{
			instance_destroy(bullet21)
		}
		if(menuthing.kills>=nshopspawn&&!instance_exists(shop)&&!bossexists)
		{
			instance_create_depth(room_width/2,512,depth+1,shop)
			nshopspawn+=shopspawninc
			if(menuthing.difficulty>=5)
			{
				shopspawninc+=2
			}
			else
			{
				shopspawninc+=15
			}
		}
	}
	if(hp<=0)
	{
		dead=true
	}
	if(dead)
	{
		hp=0
		instance_destroy(zombie)
	}
	
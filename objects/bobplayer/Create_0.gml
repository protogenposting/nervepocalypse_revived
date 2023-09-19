/// @description Insert description here
// You can write your code in this editor
gunselected=0
randomize()
hsp=0
vsp=0
movespd=3
audio_play_sound(menuthing.secretthemes[menuthing.musictheme],1000,true)
hp=30
mhp=30
i=0
drawing=false
dodge=false
dodgekey = mouse_check_button_pressed(mb_right)
guni=0
gunreload=15
scorey=0
alarm[1]=1
ammo=bulletsecret
airtime=0
stilltime=0

gun[0]={
	cost:0,
	owned: true,
	sprite: gun1,
	reload: 15,
	desc: "basic gun, 15 FOR, no abilities",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[1]={
	cost: 300,
	owned: false,
	sprite: gun1,
	reload: 120,
	desc: "rocket launcher, 120 FOR, shoots a powerful rocket that explodes and shoots you backwards",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,rocket)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[2]={
	cost: 750,
	owned: false,
	sprite: gun2,
	reload: 7.5,
	desc: "uzi, 7.5 FOR, large spread",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-45,45)
			inst.image_angle=inst.direction
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[3]={
	cost:2000,
	owned: false,
	sprite: gun5,
	reload: 60*1.5,
	desc: "soul sniper, 90 FOR, deals massive damage",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			repeat(10)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.image_angle=inst.direction
				player.i[1]=reload
				player.kb=7
			}
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[4]={
	cost: 1000,
	owned: false,
	sprite: gun3,
	reload: 30,
	desc: "shotgun, 30 FOR, shoots a spread of 6 bullets",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			repeat(5)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.speed=15
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-45,45)
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-45,45)
				inst.image_angle=inst.direction
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[5]={
	cost: 2000,
	owned: false,
	sprite: gun6,
	reload: 10,
	desc: "Rez Blezter, 10 FOR, shoots 2 homing ghosts along with your ammo",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			
			
			inst=instance_create_depth(player.x,player.y,0,bulletghost)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+45
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.image_angle=inst.direction
			
			inst=instance_create_depth(player.x,player.y,0,bulletghost)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)-45
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.image_angle=inst.direction
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[6]={
	cost: 1500,
	owned: false,
	sprite: gun7,
	reload: 60,
	desc: "Buzz blaster, 60 FOR, shoots 8 bee bullets along with your ammo",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			
			var ecs=sprite_get_width(sprite)-sprite_get_xoffset(sprite)
			repeat(4)
			{
				inst=instance_create_depth(player.x,player.y,0,bullet4)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+45
				inst.speed=15
				var new_x = inst.x + lengthdir_x(ecs, inst.direction) + lengthdir_x(0, inst.direction - 90)
				var new_y = inst.y + lengthdir_y(ecs, inst.direction) + lengthdir_y(0, inst.direction - 90)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.image_angle=inst.direction
				ecs-=15
			}
			
			var ecs=sprite_get_width(sprite)-sprite_get_xoffset(sprite)
			repeat(4)
			{
				inst=instance_create_depth(player.x,player.y,0,bullet4)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)-45
				inst.speed=15
				var new_x = inst.x + lengthdir_x(ecs, inst.direction) + lengthdir_x(0, inst.direction - 90)
				var new_y = inst.y + lengthdir_y(ecs, inst.direction) + lengthdir_y(0, inst.direction - 90)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.image_angle=inst.direction
				ecs-=15
			}
			player.i[1]=reload
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[7]={
	cost: 4000,
	owned: false,
	sprite: gun4,
	reload: 1,
	desc: "minigun, 1 FOR, has a large spread",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			inst.image_angle=inst.direction
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[8]={
	cost: 4000,
	owned: false,
	sprite: gun9,
	reload: 2,
	desc: "neon minigun, 2 FOR, deals triple damage and has a large spread",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(3)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_x(0, inst.direction - 90)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction) + lengthdir_y(0, inst.direction - 90)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[9]={
	cost: 7000,
	owned: false,
	sprite: gun10,
	reload: 7,
	desc: "the legend, 7 FOR, summons bullets in a circle around you",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(3)
			{
				inst=instance_create_depth(player.x+irandom_range(-64,64),player.y+irandom_range(-64,64),0,ammotype)
				inst.direction=point_direction(inst.x,inst.y,mouse_x,mouse_y)
				inst.speed=15
				inst.direction=diry
				inst.image_angle=inst.direction
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[10]={
	cost: 7000,
	owned: false,
	sprite: gun11,
	reload: 3,
	desc: "the mainframe, 3 FOR, spawns bullets from the sky",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(3)
			{
				inst=instance_create_depth(player.x+irandom_range(-64,64),128,0,ammotype)
				inst.direction=point_direction(inst.x,inst.y,mouse_x,mouse_y)
				inst.speed=15
				inst.direction=diry
				inst.image_angle=inst.direction
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
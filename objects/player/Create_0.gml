/// @description Insert description here
// You can write your code in this editor
menuthing.kills=0
charge=0

auto=false

deathcause=""

bpm=120
beat=0
nbeat=[0,0]
currenttheme=0

ogdifficulty=menuthing.difficulty

menuselected=0
itemselected=0
shopping=false

dead=false 

combo=1

shopspawninc=25
nshopspawn=5

bossmult=400
bulletmin=0
stilltime=0
hitting=false
randomize()
alarm[3]=60/15
x=room_width/2
alarm[5]=360
rottyoa=0
vsp=0
hit=false
hsp=0
movespd=7.5
grav=1
rolling=false
jsp=17
fric=0.7
knifesteal=false
hangglider=false
hp=menuthing.difflives[menuthing.difficulty]
mhp=menuthing.difflives[menuthing.difficulty]
i[0]=0
i[1]=0
i[2]=0
i[3]=0
scorey=0
money=0
fire=false
alarm[2]=1
airtime=0
image_speed=1
drawing=true
ammo=bullet
gunselected=0
kb=0
image_index_real=0
uial=1
bouncy=false
melee=false
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
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[1]={
	cost: 100,
	owned: false,
	sprite: gun15,
	reload: 60,
	desc: "rocket launcher, 120 FOR, shoots a 3 powerful rockets that explode and shoot you backwards",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var rotty=point_direction(player.x,player.y,mouse_x,mouse_y)-5
			repeat(3)
			{
				inst=instance_create_depth(player.x,player.y,0,rocket)
				inst.direction=rotty
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.image_angle=inst.direction
				inst.damage*=player.combo
				rotty+=5
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[2]={
	cost: 600,
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
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)+irandom_range(-45,45)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[3]={
	cost:1000,
	owned: false,
	sprite: gun5,
	reload: 60*1.5,
	desc: "soul sniper, 90 FOR, deals massive damage",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				inst.damage*=10
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
				inst.image_angle=inst.direction
				inst.damage*=player.combo
				player.i[1]=reload
				player.kb=7
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
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			repeat(5)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)+random_range(-45,45)
				inst.image_angle=inst.direction
				inst.damage*=player.combo
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[6]={
	cost: 4000,
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
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			
			inst=instance_create_depth(player.x,player.y,0,bulletghost)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)+45
			inst.image_angle=inst.direction
			
			inst=instance_create_depth(player.x,player.y,0,bulletghost)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)-45
			inst.image_angle=inst.direction
			
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[5]={
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
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			var ecs=sprite_get_width(sprite)-sprite_get_xoffset(sprite)
			repeat(4)
			{
				inst=instance_create_depth(player.x,player.y,0,bullet4)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)-45
				inst.image_angle=inst.direction
				ecs-=15
				inst.damage*=player.combo
			}
			
			var ecs=sprite_get_width(sprite)-sprite_get_xoffset(sprite)
			repeat(4)
			{
				inst=instance_create_depth(player.x,player.y,0,bullet4)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+45
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
				inst.image_angle=inst.direction
				ecs-=15
				inst.damage*=player.combo
			}
			player.i[1]=reload
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[7]={
	cost: 9000,
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
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)+random_range(-25,25)
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[8]={
	cost: 9000,
	owned: false,
	sprite: gun9,
	reload: 2,
	desc: "neon minigun, 2 FOR, deals triple damage and has a large spread",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			inst.damage*=3
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=diry
			inst.image_angle=inst.direction
			inst.damage*=player.combo
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[9]={
	cost: 9000,
	owned: false,
	sprite: gun10,
	reload: 7,
	desc: "the legend, 7 FOR, summons bullets in a circle around you",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(30)
			{
				inst=instance_create_depth(player.x+irandom_range(-64,64),player.y+irandom_range(-64,64),0,ammotype)
				inst.direction=point_direction(inst.x,inst.y,mouse_x,mouse_y)
				inst.speed=15
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=player.combo
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[10]={
	cost: 9000,
	owned: false,
	sprite: gun11,
	reload: 3,
	desc: "the mainframe, 3 FOR, spawns bullets from the sky",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(30)
			{
				inst=instance_create_depth(player.x+irandom_range(-64,64),128,0,ammotype)
				inst.direction=270
				inst.speed=15
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=player.combo
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
gun[4]={
	cost: 2000,
	owned: false,
	sprite: gun8,
	reload: 13,
	desc: "B.I.G, 13 FOR, shoots 3 bullets in a spread",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			inst=instance_create_depth(player.x,player.y,0,ammotype)
			inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
			inst.speed=15
			var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
			inst.x=new_x
			inst.y=new_y
			inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)
			inst.image_angle=inst.direction
			repeat(2)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=point_direction(new_x,new_y,mouse_x,mouse_y)+random_range(-45,45)
				inst.image_angle=inst.direction
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
}
array_insert(gun,4,{
	cost: 1500,
	owned: false,
	sprite: gun16,
	reload: 45,
	desc: "Worker's permit, 45 FOR, shoots an explosive nail that splits into a circle of your ammo type on impact",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)
			repeat(1)
			{
				inst=instance_create_depth(player.x,player.y,0,nail)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage=1
				inst.damage*=player.combo
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
})
array_insert(gun,1,{
	cost: 150,
	owned: false,
	sprite: gun12,
	reload: 1,
	charge:0,
	desc: "Gape gaper, no FOR, holding down fire charges your shots!",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			audio_stop_sound(chargeshot)
			var audyo=audio_play_sound(chargeshot,1000,false)
			audio_sound_pitch(audyo,charge)
			player.charge=charge
			charge+=0.05
			if(player._input.firereleased)
			{
					var diry=point_direction(player.x,player.y,mouse_x,mouse_y)
					inst=instance_create_depth(player.x,player.y,0,ammotype)
					inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
					inst.speed=15
					var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
					var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
					inst.x=new_x
					inst.y=new_y
					inst.direction=diry
					inst.image_angle=inst.direction
					inst.damage*=charge*2
					inst.damage*=player.combo
				charge=0
				player.i[1]=reload
				player.kb=7
				audio_play_sound(riflefire,1000,false)
			}
		}
	}
})
array_insert(gun,1,{
	cost: 200,
	owned: false,
	sprite: gun14,
	reload: 7,
	desc: "Blackjack, 7 FOR, reduced damage but always pushes zombies",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(1)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=0.1
				inst.damage*=player.combo
			}
			repeat(1)
			{
				inst=instance_create_depth(player.x,player.y,0,bullet)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=player.combo
				inst.damage*=0.1
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
})
array_insert(gun,1,{
	cost: 200,
	owned: false,
	sprite: gun13,
	reload: 60,
	desc: "mystery mag, 60 FOR, shotgun that creates random effect bullets",
	func: function(ammotype){
		if(player.i[1]<=0)
		{
			player.alarm[6]-=5
			var diry=point_direction(player.x,player.y,mouse_x,mouse_y)+random_range(-25,25)
			repeat(1)
			{
				inst=instance_create_depth(player.x,player.y,0,ammotype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=player.combo
			}
			var bulletype=choose(bullet2,bullet20,bullet22,bullet13,bullet5,bullet9)
			repeat(5)
			{
				inst=instance_create_depth(player.x,player.y,0,bulletype)
				inst.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+irandom_range(-64,64)
				inst.speed=15
				var new_x = inst.x + lengthdir_x(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				var new_y = inst.y + lengthdir_y(sprite_get_width(sprite)-sprite_get_xoffset(sprite), inst.direction)
				inst.x=new_x
				inst.y=new_y
				inst.direction=diry
				inst.image_angle=inst.direction
				inst.damage*=player.combo
			}
			player.i[1]=reload
			player.kb=7
			audio_play_sound(riflefire,1000,false)
		}
	}
})

supply[0]={
	price: 100,
	bought:false,
	sprite: upgrade1,
	desc:"health crate, restores some health",
	func: function(){
		player.hp+=player.mhp/5
		price*=2
	}
}
supply[1]={
	price: 500,
	bought:false,
	sprite: upgrade2,
	desc:"healing knife, your knife can now regenerate some health with each hit",
	func: function(){
		player.knifesteal=true
		player.supply[1].bought=true
	}
}
supply[2]={
	price: 1000,
	bought:false,
	desc:"bee knife, your knife can now spawn bees each hit and deals bonus damage that gets more powerful the more health the enemy has",
	sprite: upgrade3,
	func: function(){
		player.hitfunc=function(targ){
			targ.hp-=targ.mhp/100
			repeat(5)
			{
				inst=instance_create_depth(targ.x+random_range(-256,256),targ.y+random_range(-256,256),-10,bullet4)
			}
			inst.direction=irandom(360)
			inst.speed=10
		}
		player.supply[2].bought=true
	}
}
supply[3]={
	price: 2000,
	bought:false,
	sprite: Sprite67,
	desc:"drone strike, when your knife is out, a drone floats above your head and shoots bonus bullets",
	func: function(){
		player.extragun=true
		player.supply[3].bought=true
	}
}
supply[4]={
	price: 500,
	bought:false,
	sprite: upgrade4,
	desc:"heavy knife, your knife deals 10 damage instead of 4 and you can now ground pound",
	func: function(){
		if(!player.supply[11].bought)
		{
			player.knifedam=10
		}
		player.supply[4].bought=true
	}
}
supply[5]={
	price: 1000,
	bought: false,
	sprite: upgrade5,
	desc:"jetpack, you can now fly with a jetpack",
	func: function(){
		player.supply[5].bought=true
	}
}
supply[6]={
	price: 250,
	bought: false,
	sprite: upgrade5,
	desc:"passive regen, you regen a 60th of your hp every second!",
	func: function(){
		player.supply[6].bought=true
	}
}
supply[7]={
	price: 1000,
	bought: false,
	sprite: upgrade5,
	desc:"gravity stabilizer, keeps your gravity consistent no matter what",
	func: function(){
		player.supply[7].bought=true
	}
}
supply[8]={
	price: 4000,
	bought: false,
	sprite: upgrade5,
	desc:"slap	squad, every 10 hits you deal 10x damage",
	func: function(){
		player.supply[8].bought=true
	}
}
supply[9]={
	price: 2000,
	bought: false,
	sprite: upgrade5,
	desc:"drone strike, every time you get hit, drones come in to help by dropping bot bullets down",
	func: function(){
		player.supply[9].bought=true
	}
}
supply[10]={
	price: 3000,
	bought: false,
	sprite: upgrade5,
	desc:"Blade of healing, your knife can now regenerate even more health with each hit",
	func: function(){
		player.supply[10].bought=true
	}
}
supply[11]={
	price: 500,
	bought:false,
	sprite: upgrade4,
	desc:"titanium knife, your knife deals 30 damage",
	func: function(){
		player.knifedam=30
		player.supply[11].bought=true
	}
}
supply[12]={
	price: 1500,
	bought:false,
	sprite: upgrade4,
	desc:"aerogel knife, your knife attacks twice as fast",
	func: function(){
		player.knifedam=10
		player.supply[12].bought=true
	}
}
supply[13]={
	price: 1500,
	bought:false,
	sprite: upgrade4,
	desc:"holy knife, getting a kill gives 15 frames of immunity",
	func: function(){
		player.supply[13].bought=true
		player.supply[14].price=9999999
	}
}
supply[14]={
	price: 1500,
	bought:false,
	sprite: upgrade4,
	desc:"hell knife, sets zombies on fire, 10% chance every hit to shoot out a meteor",
	func: function(){
		player.supply[14].bought=true
		player.supply[13].price=9999999
	}
}
supply[15]={
	price: 50,
	bought:false,
	sprite: upgrade4,
	desc:"this is the fire signal! it will shoot a beam into space and summon the fire zombie! i'd recommend only doing this if you have good enough gear.",
	func: function(){
		instance_create_depth(player.x,player.y,player.depth+1,beacon)
		wavebell.rung=true
	}
}
supply[16]={
	price: 250,
	bought: false,
	sprite: upgrade5,
	desc:"pacafist regen, you gain hp exponentially as long as you arent attacking",
	func: function(){
		player.supply[16].bought=true
	}
}
gunisnotj7unes=false

hitcombo=0

skineff[0]=function(){

}
skineff[1]=function(){
	if(i[3]<=0)
	{
		var instyoa=instance_create_depth(x+image_xscale*6,y-33,depth-1,bullet8)
		instyoa.direction=180*(image_xscale<0)
		var instyoa=instance_create_depth(x+image_xscale*8,y-33,depth-1,bullet8)
		instyoa.direction=180*(image_xscale<0)
		i[3]=(hp/mhp)*60
		show_debug_message(i[3])
	}
}
skineff[2]=function(){
	if(_input.lunge)
	{
		repeat(money/4)
		{
			var instyoa=instance_create_depth(x+image_xscale*6,y-33,depth-1,ammos[irandom(array_length(ammos)-2)])
			instyoa.direction=point_direction(player.x,player.y,mouse_x,mouse_y)+irandom_range(-60,60)
			instyoa.speed=20
			money-=money/4
		}
		rolling=false
		vsp=0
		hsp=0
	}
}
skineff[3]=function(){
	if(_input.lungehold)
	{
		rolling=false
		if(vsp!=0)
		{
			rolling=false
			hsp=0
			vsp=60*grav
		}
		else
		{
			hsp=sign(hsp)*movespd*3
			vsp=0
			i[0]=0
			i[1]=120
		}
	}
}
skineff[4]=function(){
	if(_input.lungehold)
	{
		rolling=false
		hsp+=(rkey-lkey)*0.1
		rottyoa+=-hsp
		i[1]=60
	}
}
skineff[5]=function(){
	
}
skineff[6]=function(){
	movespd=30
	if(abs(hsp)<=0.5)
	{
		sprite_index=bobboxgamereal1
	}
	else
	{
		sprite_index=bobboxgamereal
	}
	image_index+=1
}
skineff[7]=function(){
	
}
extragun=false
supply[0].bought=false
zombtypes=[zombie,zombielil,zombiefly,zombienerve,zombiebird,zombiejump,zombiehigh,zombieday,zombieday,zombiegel]
bosses=[zombieboss1]
bossesfought=[false,false,false,false,false,false,false,false,false,false,false,false,false]
hitfunc=function(targ){
	
}
knifedam=4
alarm[0]=256

image_speed=0

if(instance_exists(multiplayer))
{
	instance_destroy()
}

ammos=[bullet,bullet2,bullet3,bullet4,bullet5,bullet6,bullet12,bullet13,bullet9,bullet10,bullet11,bullet7,bullet8,bullet14,bullet15,bullet16,bullet27,bullet24,bullet20,bullet22,bullet23,bullet25,bulletsecret3,bullet26,bullet18,bullet28,bullet29,bullet30,bulletop]
descs=["basic bullet, has knockback and headshot capability","fire bullet, deals dot damage","peircing bullet, can go through enemies","bee bullet, circles enemies and homes in on them","rez bullet, deals more damage the more health an enemy has","solar flare bullet, peirces enemies and moves upwards","bomberang bullet, explodes on contact with enemies and peirces infinintley","potato bullet, creates mashed potatoes on impact that drain zombie health and slow them","fish bullet, swims through the air and latch onto enemies","doge bullet, attacks enemies in a swarm of barking and fury","vampire bullet, homes in on enemies and heals on kill","bouncy bullet, deals increased damage but is gravity affected","laser bullet, spreads across the screen","cloud bullet, picks up zombies and chucks them into the sky","homing sniper bullet, bounces off of walls towards enemies","hypno bullet, killed zombies come back to life to help you","giggler bullet, the joyous creature bounces around happily","saw bullet, bounces around and splits into 3 weaker saws","flower bullets, create healing flowers on contact with zombies","aqua bullet, deals high damage and stuns zombies","terra bullet, combines the powers of the black hole, flower, fire, and water bullets into one super powerful bullet","bot bullet, homes in on enemies","true peircing bullet, targets the furthest target and attacks them","nano bullet, homes in on zombies","black hole bullet, changes gravity","shroomy bullet, creates homing spores on its path of travel","meteor bullet, deals massive damage and sets enemies ablaze","portal bullet, teleports you to wherever it lands"]

audtheme=audio_play_sound(menuthing.idlethemes[menuthing.musictheme],1000,true)
audboss=audio_play_sound(menuthing.bossthemes[menuthing.musictheme],1000,true)

bullet_number=function(){
	var num=0
	var nummy=0
	repeat(array_length(ammos))
	{
		nummy+=instance_number(ammos[num])
		num+=1
	}
	return nummy;
}
destroy_bullets=function(number,target){
	while(number>target)
	{
		var type=irandom(array_length(ammos)-1)
		if(instance_exists(type))
		{
			inst=instance_find(ammos[type],0)
			instance_destroy(inst)
		}
		number-=1
	}
}

sprite_index=menuthing.skins[menuthing.skin]

alarm[6]=60*15

eval=0
event[0]={
	name:"meteor shower!",
	func: function(){
		repeat(60)
		{
			inst=instance_create_depth(irandom(room_width),64,player.depth,firefall)
			if(instance_exists(inst))
			{
				inst.vspeed=10
			}
		}
	}

}
event[1]={
	name:"flower shower!",
	func: function(){
		repeat(120)
		{
			instance_create_depth(irandom(room_width),64,player.depth,flowah)
		}
	}
}
event[2]={
	name:"saw burst!",
	func: function(){
		repeat(10)
		{
			inst=instance_create_depth(player.x,player.y,player.depth,bullet19)
			inst.direction=irandom(360)
			inst.speed=1
		}
	}
}
event[3]={
	name:"zombie resistance!",
	func: function(){
		with(zombie)
		{
			hp*=1.1
			mhp*=1.1
		}
	}
}
event[4]={
	name:"spores!",
	func: function(){
		var rot=0
		repeat(8)
		{
			inst=instance_create_depth(player.x,player.y,player.depth,bullet28)
			inst.direction=rot
			inst.speed=10
			menuthing.skinacheivment[7].unlocked=true
			rot+=360/8
		}
	}
}
event[5]={
	name:"BEEES!",
	func: function(){
		var rot=0
		repeat(60)
		{
			inst=instance_create_depth(player.x,player.y,player.depth,bullet4)
			inst.direction=rot
			inst.speed=10
			rot+=360/60
		}
	}
}
event[6]={
	name:"nerve zombies!",
	func: function(){
		with(zombie)
		{
			if(hp<=100)
			{
				instance_create_depth(x,y,depth,zombienerve)
				instance_destroy()
			}
		}
	}
}
event[7]={
	name:"low gravity!",
	func: function(){
		with(zombie)
		{
			grav*=0.5
		}
		with(player)
		{
			grav*=0.5
		}
	}
}
event[8]={
	name:"high gravity!",
	func: function(){
		with(zombie)
		{
			grav*=2
		}
		with(player)
		{
			grav*=2
		}
	}
}
event[9]={
	name:"gravity reset!",
	func: function(){
		with(zombie)
		{
			grav=1
		}
		with(player)
		{
			grav=1
		}
	}
}
event[10]={
	name:"dance party!",
	func: function(){
		with(zombie)
		{
			alarm[11]=60*5
		}
	}
}
event[11]={
	name:"hp rain!",
	func: function(){
		repeat(30)
		{
			inst=instance_create_depth(irandom(room_width),128,player.depth,healthrestore)
			inst.vspeed=10
		}
	}
}
event[12]={
	name:"fling!",
	func: function(){
		player.hsp=irandom_range(-30,30)
		player.vsp=-50
		player.y-=player.grav*2
	}
}
event[13]={
	name:"random shop item price halved!",
	func: function(){
		var opt=choose(0,1)
		if(opt==0)
		{
			player.supply[irandom(array_length(player.supply)-1)].price/=2
		}
		if(opt==1)
		{
			player.gun[irandom(array_length(player.gun)-1)].cost/=2
		}
	}
}
event[14]={
	name:"friends!",
	func: function(){
		repeat(3)
		{
			inst=instance_create_depth(player.x+irandom_range(-128,128),player.y,player.depth,bullet10)
		}
	}
}
event[15]={
	name:"big zombies!",
	func: function(){
		with(zombie)
		{
			image_xscale*=2
			image_yscale*=2
			y-=(image_xscale*64)/2
			movespd*=0.5
			hp*=2
			mhp*=2
		}
	}
}
event[16]={
	name:"GET NOOBED!",
	func: function(){
		with(zombie)
		{
			if(hp<=100)
			{
				instance_create_depth(x,y,depth,zombielil)
				hp=-1
			}
		}
	}
}
event[17]={
	name:"difficulty+",
	func: function(){
		with(menuthing)
		{
			difficulty+=1
			if(difficulty>5)
			{
				difficulty=0
			}
		}
	}
}
event[18]={
	name:"difficulty-",
	func: function(){
		with(menuthing)
		{
			difficulty-=1
			if(difficulty<0)
			{
				difficulty=5
			}
		}
	}
}
event[19]={
	name:"Cocomelon!",
	func: function(){
		repeat(15)
		{
			instance_create_depth(irandom(room_width),128,player.depth,zombiefly)
		}
	}
}
event[20]={
	name:"Minecon!",
	func: function(){
		repeat(4)
		{
			instance_create_depth(irandom(room_width),128,player.depth,zombiehigh)
		}
	}
}
event[21]={
	name:"Spring Cleaning!",
	func: function(){
		repeat(4)
		{
			instance_create_depth(irandom(room_width),128,player.depth,zombiejump)
		}
	}
}
event[22]={
	name:"Repulsion Gel Testing!",
	func: function(){
		repeat(8)
		{
			instance_create_depth(irandom(room_width),128,player.depth,zombiegel)
		}
	}
}
event[23]={
	name:"Thanos!",
	func: function(){
		with(zombie)
		{
			if(hp<=50)
			{
				hp=-1
			}
			else
			{
				hp-=100
			}
		}
	}
}
event[24]={
	name:"black hole!",
	func: function(){
		repeat(5)
		{
			inst=instance_create_depth(room_width/2,room_height/2,player.depth,bullet18)
			inst.alarm[0]=720*2
			inst.image_xscale=5
			inst.image_yscale=5
		}
	}
}
event[25]={
	name:"BIRDEMIC",
	func: function(){
		repeat(15)
		{
			inst=instance_create_depth(room_width/2+irandom_range(-25,25),room_height/2+irandom_range(-25,25),player.depth,zombiebird)
		}
	}
}
event[26]={
	name:"SMASH BROS!",
	func: function(){
		repeat(50)
		{
			instance_create_depth(irandom(room_width),128,player.depth,player.zombtypes[irandom(array_length(player.zombtypes)-1)])
		}
	}
}
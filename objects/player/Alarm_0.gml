/// @description Insert description here
// You can write your code in this editor
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
if(!instance_exists(zombiebossfinal))
{
	var tic=0
	if(!bossexists&&instance_number(zombie)<3)
	{
		var amountspawned=(scorey/100)+1
		if(amountspawned>6)
		{
			amountspawned=6
		}
		repeat(amountspawned)
		{
			var typevariety=array_length(zombtypes)-1
			var z=irandom(scorey/50)
			if(z>=array_length(zombtypes))
			{
				z=irandom(typevariety)
			}
			var ztype=zombtypes[z]
			inst=instance_create_depth(choose(128,room_width-128),128,depth,ztype)
			if(instance_exists(inst))
			{
				inst.hp*=menuthing.zombiehealthmult[menuthing.difficulty]
				inst.mhp*=menuthing.zombiehealthmult[menuthing.difficulty]
				inst.movespd*=menuthing.zombiespeedmult[menuthing.difficulty]
				with(inst)
				{
					while(place_meeting(x,y,zombie)||place_meeting(x,y,wall))
					{
						x-=(x-(room_width/2))/60
						y-=(y-(room_height/2))/60
					}
				}
				inst2=instance_create_depth(inst.x,inst.y,inst.depth,zdraw)
				inst2.inst=inst
			}
			tic+=inst.mhp/10
		}
	}
}
alarm[0]=360/((scorey+1)/1000)

if(alarm[0]<1)
{
	alarm[0]=10
}
if(alarm[0]>360)
{
	alarm[0]=360
}
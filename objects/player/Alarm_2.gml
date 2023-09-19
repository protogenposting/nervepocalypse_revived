/// @description Insert description here
// You can write your code in this editor
if(scorey>100)
{
	if(choose(true,true,true,true,false))
	{
		repeat(irandom_range(30,100))
		{
			instance_create_depth(irandom(room_width),0,0,firefall)
		}
	}
	/*else
	{
		repeat(irandom_range(10,30))
		{
			instance_create_depth(irandom(room_width),128,0,fallwall)
		}
	}*/
}
alarm[2]=720/((scorey/100)-1)

if(alarm[2]<=0)
{
	alarm[2]=30
}
if(alarm[2]>360)
{
	alarm[2]=360
}
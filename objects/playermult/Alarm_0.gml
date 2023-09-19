/// @description Insert description here
// You can write your code in this editor
repeat((scorey/100)+1)
{
var z=irandom(scorey/50)
while(z>=array_length(zombtypes))
{
	z-=1
}
var ztype=zombtypes[z]
instance_create_depth(choose(0,room_width),room_height-160,depth,ztype)
}
alarm[0]=360
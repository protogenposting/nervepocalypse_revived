/// @description Insert description here
// You can write your code in this editor
al-=0.01
draw_set_alpha(al)
draw_rectangle(x-16,0,x+16,room_height,false)
draw_set_alpha(1)
if(al<=0)
{
	instance_destroy()
}
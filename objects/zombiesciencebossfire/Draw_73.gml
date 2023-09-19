/// @description Insert description here
// You can write your code in this editor




lavalevel+=0.01

draw_rectangle_color(0,room_height-lavalevel,room_width,room_height,c_orange,c_orange,c_orange,c_orange,false)
with(player)
{
	if(y>room_height-other.lavalevel)
	{
		hp-=0.1
	}
}
/// @description Insert description here
// You can write your code in this editor
var col=collision_line(xstart,ystart,xstart+(hspeed*2000),ystart+(vspeed*2000),invisiwall,true,true)
if(col)
{
	draw_line(xstart,ystart,xstart+(hspeed*2000),ystart+abs(col.y-ystart))
}
else
{
	draw_line(xstart,ystart,xstart+(hspeed*2000),ystart+(vspeed*2000))
}
draw_self()
image_angle=direction
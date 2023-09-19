draw_sprite(buttons,1,bbox_right+64,bbox_top-64)
var col = c_white
if(i[0]>0)
{
	drawing=!drawing
}
else
{
	drawing=true
}

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,col,drawing)

if(hangglider)
{
	draw_sprite(glider,0,x,y)
}
else
{
	var ang=point_direction(x, y, mouse_x,mouse_y)
	draw_sprite_ext(gun[gunselected].sprite,0,x+lengthdir_x(kb,ang+180),y+lengthdir_y(kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
}
/// @description Insert descriptionqqq here
// You can write your code in this editor
draw_set_color(c_red)
draw_line(x,y,x+lengthdir_x(len,direction),y+lengthdir_y(len,direction))
draw_set_alpha(0.3)
draw_line(x,y,x+lengthdir_x(len,direction+45),y+lengthdir_y(len,direction+45))
draw_line(x,y,x+lengthdir_x(len,direction-45),y+lengthdir_y(len,direction-45))
draw_line(x,y,x+lengthdir_x(len,direction+90),y+lengthdir_y(len,direction+90))
draw_line(x,y,x+lengthdir_x(len,direction-90),y+lengthdir_y(len,direction-90))
draw_line(x,y,x+lengthdir_x(len,direction+90+45),y+lengthdir_y(len,direction+90+45))
draw_line(x,y,x+lengthdir_x(len,direction-90-45),y+lengthdir_y(len,direction-90-45))
draw_set_alpha(1)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction),y+lengthdir_y(len,direction), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
        _list[| i].hp-=0.1*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction+45),y+lengthdir_y(len,direction+45), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.01*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction-45),y+lengthdir_y(len,direction-45), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.01*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction+90),y+lengthdir_y(len,direction+90), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.01*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction-90),y+lengthdir_y(len,direction-90), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.01*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction-90-45),y+lengthdir_y(len,direction-90-45), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.0005*damage
    }
}
ds_list_destroy(_list)
var _list = ds_list_create();
var _num = collision_line_list(x,y,x+lengthdir_x(len,direction+90+45),y+lengthdir_y(len,direction+90+45), zombie, false, true, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       direction-=(direction-point_direction(x,y,_list[| i].x,_list[| i].y))/60
	   _list[| i].hp-=0.0005*damage
    }
}
ds_list_destroy(_list)
draw_set_color(c_green)
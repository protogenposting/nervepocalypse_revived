/// @description Insert description here
// You can write your code in this editor
var _data = video_draw();
var _status = _data[0];
draw_text(room_width/2,room_height/2,string("loading..."))
if (_status == 0)
{
    var _surface = _data[1];
    draw_surface(_surface, 0, 0);
}
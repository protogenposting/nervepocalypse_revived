/// @description Insert description here
// You can write your code in this editor
if(gamepad_is_connected(0))
{
	window_mouse_set(window_mouse_get_x()+(gamepad_axis_value(0,gp_axisrh)*25), window_mouse_get_y()+(gamepad_axis_value(0,gp_axisrv)*25));
}
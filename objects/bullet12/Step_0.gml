/// @description Insert description here
// You can write your code in this editor
image_angle=direction
if(dest)
{
	direction+=angle_difference(point_direction(x,y,player.x,player.y),direction)/10
	effect_create_above(ef_spark,x,y,1,c_aqua)
}
else
{
	effect_create_above(ef_spark,x,y,1,c_orange)
}
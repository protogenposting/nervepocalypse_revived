/// @description Insert description here
// You can write your code in this editor




player.x=x
player.y=y
with(player)
{
	var col=instance_place(x,y,wall)
	while(col)
	{
		x+=(x-col.x)/60
		y+=(x-col.y)/60
		var col=instance_place(x,y,wall)
	}
}
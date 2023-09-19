/// @description Insert description here
// You can write your code in this editor
other.hp-=damage
other.hsp*=-damage
if(y<other.y-((16)*image_yscale))
{
	effect_create_above(ef_firework,x,y,0.2,c_red)
	other.hsp*=2
}
instance_destroy()
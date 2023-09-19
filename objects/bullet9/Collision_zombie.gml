/// @description Insert description here
// You can write your code in this editor
if(choose(true,false)&&target==-1)
{
	other.hp-=damage
	instance_destroy()
}
else
{
	other.hp-=0.005*damage
	direction+=180
	target=other
}
/// @description Insert description here
// You can write your code in this editor
if(other.hp>9000)
{
	other.hp-=4
}
else
{
	other.hp-=other.hp/damage
}
direction+=180
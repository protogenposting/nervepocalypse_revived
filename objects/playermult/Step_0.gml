/// @description Insert description here
// You can write your code in this editor
_input = rollback_get_input();
lkey=_input.left
rkey=_input.right
jkey=_input.up
hkey=_input.glide
dkey=_input.dash

if(_input.fire)
{
	func[gunselected](ammo)
}
i[0]-=1
i[1]-=1

if(kb>0)
{
	kb-=1
}
if(hp<=0)
{
	show_message("game over! final score: " + string(scorey))
	game_end()
}
if(dkey)
{
	hsp=hsp*5
}
if(lkey)
{
if(hsp>-movespd)
{
hsp-=movespd*fric
}
}
else if(rkey)
{
if(hsp<movespd)
{
hsp+=movespd*fric
}
}
if(!lkey&&!rkey&&vsp==0||hsp*sign(hsp)>movespd)
{
hsp*=fric
}
if(hsp!=0)
{
image_xscale=sign(hsp)
}
if(place_meeting(x,y+1,wall))
{
hangglider=false
if(vsp>0)
{
	global.p1 = part_type_create();
	part_type_shape(global.p1, pt_shape_square);
	part_type_size(global.p1, 0.01, 0.1, 0, 0);
	part_type_scale(global.p1, 1, 1);
	part_type_colour1(global.p1, c_dkgray);
	part_type_alpha2(global.p1, 1, 1);
	part_type_speed(global.p1, 2, 4, 0, 0);
	part_type_direction(global.p1, 0,  180, 0, 0);
	part_type_gravity(global.p1, 0.20, 270);
	part_type_orientation(global.p1, 0, 0, 0, 0, 1);
	part_type_blend(global.p1, 1);
	part_type_life(global.p1, 15, 60);
	var ind=part_system_create()
	part_particles_create(ind, x, bbox_bottom, global.p1, 10);
	vsp=0
}

if(hsp*sign(hsp)>0.5)
{
	global.p1 = part_type_create();
	part_type_shape(global.p1, pt_shape_square);
	part_type_size(global.p1, 0.01, 0.1, 0, 0);
	part_type_scale(global.p1, 1, 1);
	part_type_colour1(global.p1, c_dkgray);
	part_type_alpha2(global.p1, 1, 1);
	part_type_speed(global.p1, 2, 4, 0, 0);
	part_type_direction(global.p1, point_direction(x,bbox_bottom,x-hsp,y)-15,  point_direction(x,bbox_bottom,x-hsp,y)-180, 0, 0);
	part_type_gravity(global.p1, 0.20, 270);
	part_type_orientation(global.p1, 0, 0, 0, 0, 1);
	part_type_blend(global.p1, 1);
	part_type_life(global.p1, 15, 60);
	var ind=part_system_create()
	part_particles_create(ind, x, bbox_bottom, global.p1, 2);
}

if(jkey)
{
vsp=-jsp
}
if(hkey)
{
vsp=-jsp*2
}
}
else
{
	hangglider=hkey
}
if(!hangglider||vsp<1)
{
	vsp+=grav-(hangglider*0.5)
}
if(place_meeting(x+hsp,y,wall))
{
    while(!place_meeting(x+sign(hsp),y,wall))
    {
        x += sign(hsp)
    }
    hsp=0
}
x+=hsp
if(place_meeting(x,y+vsp,wall))
{
    while(!place_meeting(x,y+sign(vsp),wall))
    {
        y += sign(vsp)
    }
    if(vsp>=20)
    {
    //put stuff for long falls here
    }
    vsp = 0
}
y+=vsp


if(i[0]>0)
{
	col = c_red
	drawing=!drawing
}
else
{
	drawing=true
}



var ecs=0
var why=128
var num=0
repeat(array_length(ammos))
{
	if(keyboard_check_pressed(ord(num+1)))
	{
		ammo=ammos[num]
		ammonum=num
	}
	ecs+=64
	num+=1
}

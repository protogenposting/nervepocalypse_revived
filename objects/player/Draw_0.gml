 /// @description Insert description here
// You can write your code in this editor
image_xscale=-sign((mouse_x<x)-0.5)
if(abs(hsp)>0.1)
{
	if(lvsp>0&&vsp==0)
	{
		negfrot=false
		frot=0
		frot2=180
	}
	frot+=movespd*2
	if(frot>=360)
	{
		frot-=360
	}
	if(frot>=180)
	{
		negfrot=true
	}
	if(negfrot)
	{
		frot2+=movespd*2
		if(frot2>=360)
		{
			frot2-=360
		}
	}
}
else
{
	negfrot=false
	frot-=(frot)/10
	frot2-=(frot2-180)/10
}
function draw_player(col){
	var offsety=frot/100
	var rottyoay=0
	var lenny=8
	if(vsp<0)
	{
		frot=-90
		frot2=-90
		rottyoay=-90*image_xscale
		lenny=-10*image_xscale
	}
	draw_sprite_ext(foot1,image_index,x-16+lengthdir_x(lenny,90-frot2*image_xscale),y+40+lengthdir_y(lenny,90-frot2*image_xscale)-offsety,image_xscale*1.5,1.5,rottyoay,col,drawing)
	draw_sprite_ext(foot1,image_index,x+16+lengthdir_x(lenny,270-frot*image_xscale),y+40+lengthdir_y(lenny,270-frot*image_xscale)-offsety,image_xscale*1.5,1.5,rottyoay,col,drawing)
	var ang=point_direction(x, y, mouse_x,mouse_y)
	draw_sprite_ext(backhand1,image_index,x+lengthdir_x(32,ang+180),y+lengthdir_y(32,ang+180),1.5,-sign((mouse_x<x)-0.5)*1.5,ang,c_white,1)
	draw_sprite_ext(sprite_index,image_index,x,y-offsety,image_xscale*1.5,1.5,0,col,drawing)
	var ang=point_direction(x+image_xscale*8, y-48-offsety, mouse_x,mouse_y)
	draw_sprite_ext(head1,image_index,x+image_xscale*8,y-48-offsety,1.5,image_xscale*1.5,ang,col,drawing)
	draw_sprite_ext(eyes,menuthing.eye,x-8*-image_xscale+lengthdir_x(10,ang),y-40+lengthdir_y(8,ang)-offsety,1.5,image_xscale*1.5,ang,col,drawing)
	draw_sprite_ext(mouths,menuthing.mouth,x-8*-image_xscale+lengthdir_x(10,ang),y-40+lengthdir_y(8,ang)-offsety,1.5,image_xscale*1.5,ang,col,drawing)
}
uial-=0.001
draw_sprite_ext(buttons,1,bbox_right+64,bbox_top-64,1,1,0,c_white,uial)
draw_sprite_ext(scrolltoswap,1,x,bbox_top-96,1,1,0,c_white,uial)
var col = c_white
if(bouncy)
{
	col = c_aqua
}
if(i[0]>0)
{
	drawing=!drawing
}
else
{
	drawing=true
}

if(!rolling)
{
	if(supply[5].bought)
	{
		draw_sprite_ext(jetpackplayer,vsp>0,x,y,image_xscale,image_yscale*grav,rottyoa,col,drawing)
	}
	if(hangglider)
	{
		rottyoa-=(rottyoa-((-image_xscale*65)))/10
		draw_player(col)
		draw_sprite_ext(glider,0,x,bbox_top+32,-image_xscale,image_yscale*sign(grav),0,col,drawing)
	}
	else
	{
		if(supply[5].bought&&vsp!=0)
		{
			rottyoa-=(rottyoa-((-hsp*3)))/10
		}
		else if(_input.lungehold&&menuthing.skin==3)
		{
			rottyoa-=(rottyoa-((hsp*3)))/10
		}
		else
		{
			rottyoa-=(rottyoa)/3
		}
		
		var extend=1
		if(vsp>0)
		{
			extend+=((vsp/100))
		}
		draw_player(col)
	}
}
else
{
	draw_player(col)
}
if(fire)
{
	draw_sprite(Sprite70,image_index_real,x,y-64)
}
if(menuthing.skins[menuthing.skin]==beatboppinskin)
{
	draw_text(x,y-128,"combo: "+string(combo))
}
hitting=false
if(!rolling&&!shopping)
{
	if(!melee)
	{
		var ang=point_direction(x, y, mouse_x,mouse_y)
		draw_sprite_ext(gun[gunselected].sprite,image_index,x+lengthdir_x(-64+kb,ang+180),y+lengthdir_y(-64+kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
		
		
		draw_sprite_ext(fronthand1,image_index,x+lengthdir_x(-64+kb,ang+180),y+lengthdir_y(-64+kb,ang+180),1.5,-sign((mouse_x<x)-0.5)*1.5,ang,c_white,1)
		
		
		if(charge>0)
		{
			var offsetx=-image_xscale*128
			draw_rectangle(x-16+offsetx,bbox_bottom,x+16+offsetx,bbox_bottom-charge*32,false)
			var why=bbox_bottom
			repeat(charge)
			{
				draw_rectangle(x-17+offsetx,why,x+17+offsetx,why-32,true)
				why-=32
			}
		}
	}
	else if(melee)
	{
		if(i[1]>0&&!hitting)
		{
			var ang=point_direction(x, y, mouse_x,mouse_y)
			var _list = ds_list_create();
			var _num = collision_line_list(x , y, x +lengthdir_x(200,ang), y+lengthdir_y(200,ang), zombie, false, true, _list, false);
			if _num > 0 && !hit && image_index_real==3
			{
				hitting=true
				hit=true
				if(supply[8].bought)
				{
					hitcombo+=1
				}
			    for (var iy = 0; iy < _num; ++iy;)
			    {
			        _list[| iy].hp-=knifedam
					if(_list[| iy].hp<=0)
					{
						if(supply[13].bought)
						{
							i[0]+=15
						}
					}
					if(supply[14].bought)
					{
						_list[| iy].fire=true
						if(irandom(9)==9)
						{
							inst=instance_create_depth(x,y,depth-1,bullet29)
							inst.direction=point_direction(x,y,mouse_x,mouse_y)
							inst.image_angle=inst.direction
						}
					}
					if(hitcombo>10)
					{
						 _list[| iy].hp-=knifedam*9
						 audio_play_sound(BEWM,1000,false)
					}
					hitfunc(_list[| iy])
					if(knifesteal)
					{
						hp+=knifedam/100
						if(supply[10].bought)
						{
							repeat(3)
							{
								hp+=knifedam/100
							}
						}
					}
			    }
			}
			ds_list_destroy(_list);
			var _list = ds_list_create();
			var _num = collision_line_list(x , y, x +lengthdir_x(200,ang), y+lengthdir_y(200,ang), wavebell, false, true, _list, false);
			if _num > 0 && !hit && image_index_real==3
			{
				hitting=true
				hit=true
			    for (var iy = 0; iy < _num; ++iy;)
			    {
			        _list[| iy].rung=true
					_list[| iy].image_speed=1
			    }
			}
			ds_list_destroy(_list);
			if(image_index_real<=4)
			{
				if(_input.firereleased)
				{
					player.i[1]=2
				}
			}
			draw_sprite_ext(knifeatt,image_index_real,x+lengthdir_x(kb,ang+180),y+lengthdir_y(kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
			if(image_index_real>sprite_get_number(knifeatt))
			{
				image_index_real=0
				i[1]=0
			}
		}
		else
		{
			var ang=point_direction(x, y, mouse_x,mouse_y)
			draw_sprite_ext(knifeidle,image_index_real,x+lengthdir_x(kb,ang+180),y+lengthdir_y(kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
		}
	}
}
if(keyboard_check(ord("Q")))
{
		
}
else if(place_meeting(x,y,shop))
{
	draw_sprite_ext(buttons,0,bbox_left-64,bbox_top-64,1,1,0,c_white,1)
}
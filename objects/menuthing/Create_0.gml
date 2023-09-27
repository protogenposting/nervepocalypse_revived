/// @description Insert description here
// You can write your code in this editor
buttonselected=0
controls=false

skineffectactive=false

eye=0
mouth=0

codey[0]=[6,9,4,2,0]
codey[1]=[0,4,0,4]
codey[2]=[8,5,2,3]
codey[3]=[15,15,15,15]

knifeonly=false
inputs=array_create(0)
maxproj=50
bvbhs=0
alarm[0]=60
acheivmentnum=0
bossesdead=0
menuthing.acheivment4=false
menuthing.acheivment5=false
menuthing.acheivment8=false
menuthing.acheivment13=false
menuthing.acheivment18=false
menuthing.acheivment15=false
finalbossdefeated=false
floorislava=false
settings=false
hiscore=0
acheivment17num=0
skin=0
gay=false
paused=false
thingsbought=0
atype=0
skins=[Sprite1,hitman,shopguy,botskin,bobskin,beatboppinskin,bobboxgamereal,ballcap,j7unes,Sprite1]
menupos=[0,room_height]
botsvsbob=false


musictheme=3
musicthemes=["SCRATCH","TUNES","PROOT","SUNNY"]
idlethemes=[theme,themetunes,themeproot,themesunny]
bossthemes=[bossattack,bossattacktunes,bossattackproot,bossattacksunny]
menuthemes=[menutheme,menuthemetunes,menuthemeproot,menuthemesunny]
secretthemes=[secrettheme,secretthemetunes,secretthemeproot,secretthemesunny]


difficulties=["CASUAL MODE","EASY","MEDIUM","HARD","PSYCHOPATH","0 BITCHES"]
difficultiesdescriptions=["Damn ur a baby!","Eh you could be worse...","The standard mode!","Looking for a challenge i see?","Oooooh spicy!","LET'S GET READY TO RUMBLE!!!!!!!!!!!!!!!!!!!"]
difficulty=2
difflives=[200,45,30,25,3,0.1]
zombiespeedmult=[0.3,1,1,1,1.5,1.5]
zombiehealthmult=[0.3,0.6,1,1.3,1.6,1.5]
zombiedamagemult=[0.3,0.9,1,2,3,5]
loadedskin=[Sprite1,""]

function count_acheviments(){
	var num=0
	var amountobtained=0
	var hiddencount=0
	var hiddencounty=0
	repeat(array_length(acheivment))
	{
		if(acheivment[num].unlocked)
		{
			if(variable_struct_exists(acheivment[num],"hidden"))
			{
				hiddencounty+=1
			}
			else
			{
				amountobtained+=1
			}
		}
		hiddencount+=variable_struct_exists(acheivment[num],"hidden")
		num+=1
	}
	var e=(amountobtained/(array_length(acheivment)-hiddencount))*100
	return e+hiddencounty
}
save_level=function(){
	//make epoc array
	array=[]
	var num=0
	repeat(array_length(menuthing.acheivment))
	{
		array_push(array,menuthing.acheivment[num].unlocked)
		num+=1
	}
	array2=[]
	var num=0
	repeat(array_length(menuthing.skinacheivment))
	{
		array_push(array2,menuthing.skinacheivment[num].unlocked)
		num+=1
	}
	var _saveData = {
		acheivments: menuthing.array,
		volumey: menuthing.vol,
		proj: menuthing.maxproj,
		hiscore: menuthing.hiscore,
		bvbhs: menuthing.bvbhs,
		skin: menuthing.skin,
		skins: menuthing.array2,
		musictheme: menuthing.musictheme,
		skinonbg: menuthing.gay,
	}
	if(instance_exists(player)&&player.scorey>menuthing.hiscore)
	{
		menuthing.hiscore= player.scorey
	}
	if(menuthing.loadedskin[0]!=Sprite1)
	{
		_saveData.customskin=menuthing.loadedskin
	}
	var _string = json_stringify(_saveData)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,"savedshit.txt")
	buffer_delete(_buffer)
	
	show_debug_message("game saved! "+_string)
}
load_level=function(){
	show_debug_message("loading save...")
	if(file_exists("savedshit.txt"))
	{
		var _buffer = buffer_load("savedshit.txt")
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		show_debug_message("game LOADED DIAPER! "+string(_loadData))
		var num=0
		repeat(array_length(_loadData.acheivments))
		{
			menuthing.acheivment[num].unlocked=_loadData.acheivments[num]
			num+=1
		}
		var num=0
		repeat(array_length(_loadData.skins))
		{
			menuthing.skinacheivment[num].unlocked=_loadData.skins[num]
			num+=1
		}
		if(variable_struct_exists(_loadData,"volumey"))
		{
			menuthing.vol=_loadData.volumey
		}
		if(variable_struct_exists(_loadData,"proj"))
		{
			menuthing.maxproj=_loadData.proj
		}
		if(variable_struct_exists(_loadData,"hiscore"))
		{
			menuthing.hiscore=_loadData.hiscore
		}
		if(variable_struct_exists(_loadData,"musictheme"))
		{
			menuthing.musictheme=_loadData.musictheme
		}
		if(variable_struct_exists(_loadData,"bvbhs"))
		{
			menuthing.bvbhs=_loadData.bvbhs
		}
		if(variable_struct_exists(_loadData,"skinonbg"))
		{
			menuthing.gay=_loadData.skinonbg
		}
		if(variable_struct_exists(_loadData,"customskin"))
		{
			menuthing.loadedskin[0]=sprite_add(_loadData.customskin[1],1,false,false,64,64)
			menuthing.loadedskin[1]=_loadData.customskin[1]
			array_pop(menuthing.skins)
			array_push(menuthing.skins,menuthing.loadedskin[0])
		}
	}
	else
	{
		
	}
}
getacheiments=function(){
		var num=0
		var numby=0
		repeat(array_length(menuthing.acheivment))
		{
			if(menuthing.acheivment[num].unlocked)
			{
				numby+=1
			}
			num+=1
			
		}
		return numby
}

button[0]={
	name: global.translation[1][global.languageselected],
	func: function(){
		room_goto(Room1)
	}
}
button[1]={
	name:global.translation[2][global.languageselected]+": "+menuthing.difficulties[menuthing.difficulty],
	func: function(){
		menuthing.difficulty+=1
		if(menuthing.difficulty>=array_length(menuthing.difficulties))
		{
			menuthing.difficulty=0
		}
		name=global.translation[2][global.languageselected]+": "+menuthing.difficulties[menuthing.difficulty]
	}
}
button[2]={
	name: global.translation[3][global.languageselected],
	func: function(){
		menuthing.settings=!menuthing.settings
	}
}
button[3]={
	name:"CREDITS",
	func: function(){
		menuthing.settings=!menuthing.settings
		menuthing.credits=true
	}
}
button[4]={
	name:"CONTROLS",
	func: function(){
		menuthing.settings=!menuthing.settings
		menuthing.controls=true
	}
}


credit[0]={
	name:"Carson but protogen (programmer/ideas/music)",
	func: function(){
		url_open("https://www.youtube.com/channel/UCpznbFDKlxKG1j-gsf4XXvA")
	}
}
credit[1]={
	name:"Aaronz2464 (original scratch game/art)",
	func: function(){
		url_open("https://youtube.com/@Aaronz2464")
	}
}
credit[2]={
	name:"scratchguy23 (music)",
	func: function(){
		url_open("https://www.youtube.com/channel/UCpznbFDKlxKG1j-gsf4XXvA")
	}
}
credit[3]={
	name:"J7unes (music)",
	func: function(){
		url_open("https://youtube.com/@J7unes")
	}
}
credit[4]={
	name:"pvzfanboy (ideas/knife)",
	func: function(){
		url_open("https://www.deviantart.com/sleepycabbyv4")
	}
}
credit[5]={
	name:"Sunny (music)",
	func: function(){
		url_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
	}
}
credit[6]={
	name:"RZ302 (original game concept)",
	func: function(){
		url_open("https://www.youtube.com/channel/UCfMUMpJKVa_muvSSRZxExhw")
	}
}
credit[7]={
	name:"discord",
	func: function(){
		url_open("https://discord.gg/MXsBvsa7dn")
	}
}

control[0]={
	name:"Move: Wasd/arrow keys",
}
control[1]={
	name:"Jump: space/up",
}
control[2]={
	name:"Glide: Q",
}
control[3]={
	name:"Fire: LMB",
}
control[4]={
	name:"Lunge: RMB",
}
control[5]={
	name:"Pound: S",
}

if(gamepad_is_connected(0))
{
	control[0]={
		name:"Move: Lstick",
	}
	control[1]={
		name:"Aim: Rstick",
	}
	control[2]={
		name:"Jump: Face1",
	}
	control[3]={
		name:"Glide: Left Back Shoulder",
	}
	control[4]={
		name:"Fire: Right Back Shoulder",
	}
	control[5]={
		name:"Lunge: Face2",
	}
	control[6]={
		name:"Pound: Face3",
	}
	control[7]={
		name:"Shop: Face4",
	}
	control[8]={
		name:"Change Shop: Pad Up/Down",
	}
	control[9]={
		name:"Select Shop Item: Pad Left/Right",
	}
}

credits=false 
vol=1

kills=0
bossdead=false
acheivment[0]={
	unlocked: false,
	sprite: acheivment1,
	namey:"first steps",
	desc:"get 5 kills... you're doing great :> (unlocks fire bullets)",
	func: function(){
		var isdone=false
		if(menuthing.kills>=5)
		{
			isdone=true
		}
		return sign(isdone+unlocked)
	}
}
acheivment[1]={
	unlocked: false,
	namey:"i quit...",
	sprite: acheivment2,
	desc:"kill any boss (unlocks peircing bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.bossdead
		return sign(isdone+unlocked)
	}
}
acheivment[2]={
	unlocked: false,
	namey:"LOOK MOM I CAN FLY",
	sprite: acheivment3,
	desc:"fly at game-breaking speeds! (unlocks bee bullets)",
	func: function(){
		var isdone=false
		isdone=abs(player.hsp)>20
		return sign(isdone+unlocked)
	}
}
acheivment[3]={
	unlocked: false,
	sprite: acheivment4,
	namey:"master of the invazion!",
	desc:"reach a score of 500.. you're great! (unlocks ReZ bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.scorey>=500
		}
		return sign(isdone+unlocked)
	}
}
acheivment[4]={
	unlocked: false,
	sprite: acheivment5,
	namey:"solar eruption!",
	desc:"get hit by a solar flare (unlocks sun bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment4
		return sign(isdone+unlocked)
	}
}
acheivment[5]={
	unlocked: false,
	sprite: acheivment11,
	namey:"DEMOMAN TF2 REAL",
	desc:"buy the rocket launcher (unlocks boomeromb bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.gun[1].owned
		}
		return sign(isdone+unlocked)
	}
}
acheivment[6]={
	unlocked: false,
	sprite: acheivment13,
	namey:"potato pahtatoh",
	desc:"reach 1000 score, you're amazing! (unlocks potato bullets, a reference to the original basic bullet sprite)                                         each acheivment corresponds to a number",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.scorey>=1000
		}
		return sign(isdone+unlocked)
	}
}
acheivment[7]={
	unlocked: false,
	namey:"how",
	sprite: acheivment8,
	desc:"go super fast vertically (unlocks fish bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=abs(player.vsp)>43
		}
		return sign(isdone+unlocked)
	}
}
acheivment[8]={
	unlocked: false,
	namey:"dead dog lmao",
	sprite: acheivment9,
	hidden:true,
	desc:"sting a doge (unlocks barker bullets)                          first steps = 0",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment8
		return sign(isdone+unlocked)
	}
}
acheivment[9]={
	unlocked: false,
	namey:"healer",
	sprite: acheivment10,
	desc:"reach 10 health over max hp (unlocks vampire bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.hp>=player.mhp+10
		}
		return sign(isdone+unlocked)
	}
}
acheivment[10]={
	unlocked: false,
	namey:"bouncy!",
	sprite: acheivment6,
	desc:"become bouncy! (unlocks bouncy bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment5
		return sign(isdone+unlocked)
	}
}
acheivment[11]={
	unlocked: false,
	sprite: acheivment12,
	namey:"certified grass hater",
	hidden:true,
	desc:"get 4200 score (unlocks laser bullets)                                     6 9 4 2 0",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.scorey>=4200
		}
		return sign(isdone+unlocked)
	}
}
acheivment[12]={
	unlocked: false,
	namey:"frequent flier",
	sprite: acheivment14,
	desc:"stay in the air for over 20 seconds (unlocks cloud bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.airtime>=20*60
		}
		return sign(isdone+unlocked)
	}
}
acheivment[13]={
	unlocked: false,
	namey:"sniper god",
	sprite: acheivment18,
	desc:"kill a speedy zombie boss from far away (unlocks sniper bounce bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment13&&instance_exists(zombieboss2)
		return sign(isdone+unlocked)
	}
}
acheivment[14]={
	unlocked: false,
	namey:"floral combat development",
	sprite: acheivment31,
	desc:"stand still for a while (unlocks hypno bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.stilltime>60*60
		}
		return sign(isdone+unlocked)
	}
}
acheivment[15]={
	unlocked: false,
	namey:"enter the void",
	hidden:true,
	sprite: acheivment19,
	desc:"die at a specific range of score (unlocks glaggle bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.hp<=0&&player.scorey>=1000&&player.scorey<=2000
		}
		return sign(isdone+unlocked)
	}
}
acheivment[16]={
	unlocked: false,
	sprite: acheivment15,
	namey:"saw your limbs of- oh wait you cant haha no limbs",
	desc:"survive below 1 health (unlocks saw bullets)",
	func: function(){
		var isdone=false
		if(instance_exists(player))
		{
			isdone=player.hp<1
		}
		return sign(isdone+unlocked)
	}
}
acheivment[17]={
	unlocked: false,
	sprite: acheivment16,
	namey:"flowering love",
	desc:"touch alot of zombies (unlocks flowering bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment17num>60*60
		return sign(isdone+unlocked)
	}
}
acheivment[18]={
	unlocked: false,
	namey:"aquadynamics",
	hidden:true,
	sprite: acheivment20,
	desc:"squash a gel zombie (unlocks water bullets)                               click acheivments to input a 6 digit code",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment18
		return sign(isdone+unlocked)
	}
}
acheivment[19]={
	unlocked: false,
	hidden:true,
	sprite: acheivment27,
	namey:"the quadforce",
	desc:"unlock the 4 elemental bullets (unlocks terra bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.acheivment[0].unlocked&&menuthing.acheivment[23].unlocked&&menuthing.acheivment[17].unlocked&&menuthing.acheivment[18].unlocked
		return sign(isdone+unlocked)
	}
}
acheivment[20]={
	unlocked: false,
	hidden: true,
	sprite: acheivment21,
	namey:"the bottening",
	desc:"get 150 score in bob vs bots mode (unlocks bot bullets)",
	func: function(){
		var isdone=false
		isdone=room==secret&&instance_exists(bobplayer)&&bobplayer.scorey>=150
		return sign(isdone+unlocked)
	}
}
acheivment[21]={
	unlocked: false,
	hidden: true,
	namey:"death to the bots!",
	sprite: acheivment28,
	desc:"get 1000 score in bob vs bots mode (unlocks true peircing bullets)",
	func: function(){
		var isdone=false
		isdone=room==secret&&instance_exists(bobplayer)&&bobplayer.scorey>=1000
		return sign(isdone+unlocked)
	}
}
acheivment[22]={
	unlocked: false,
	hidden: true,
	namey:"nanomachines, son!",
	sprite: acheivment26,
	desc:"get 2500 score in bob vs bots mode (unlocks nano bullets)",
	func: function(){
		var isdone=false
		isdone=room==secret&&instance_exists(bobplayer)&&bobplayer.scorey>=2500
		return sign(isdone+unlocked)
	}
}
acheivment[23]={
	unlocked: false,
	sprite: acheivment17,
	namey:"Absolute Master of the Invazion!",
	hidden:true,
	desc:"kill the mech-zombie (unlocks black hole bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated
		return sign(isdone+unlocked)
	}
}
acheivment[24]={
	unlocked: false,
	sprite: acheivment33,
	namey:"Fungicide!",
	hidden:true,
	desc:"kill the mech-zombie as ballcap (unlocks fungal bullets) 0 4 0 4",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated&&menuthing.skin==7
		return sign(isdone+unlocked)
	}
}
acheivment[25]={
	unlocked: false,
	sprite: acheivment34,
	namey:"MASTER OF FIYAHHHH",
	desc:"beat the game on hard or above with the floor is lava mode enabled (unlocks meteor bullets bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated&&player.ogdifficulty>=3&&menuthing.floorislava
		return sign(isdone+unlocked)
	}
}
acheivment[26]={
	unlocked: false,
	sprite: acheivment34,
	namey:"MASTER OF MELEE",
	desc:"beat the game on hard or above with knife only mode enabled (unlocks teleporter bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated&&player.ogdifficulty>=3&&menuthing.knifeonly
		return sign(isdone+unlocked)
	}
}
acheivment[26]={
	unlocked: false,
	sprite: acheivment34,
	namey:"MASTER OF MELEE",
	desc:"beat the game on hard or above with knife only mode enabled (unlocks teleporter bullets)",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated&&player.ogdifficulty>=3&&menuthing.knifeonly
		return sign(isdone+unlocked)
	}
}

skinacheivment[0]={
	unlocked: true,
	namey:"default guy",
	desc:"do nothing (unlocks defualt skin)",
	sprite: acheivment22,
	func: function(){
		var isdone=false
		isdone=true
		return sign(isdone+unlocked)
	}
}
skinacheivment[1]={
	unlocked: false,
	namey:"Massacre",
	sprite: acheivment29,
	desc:"Kill 1000 zombies (unlocks Hitman)",
	func: function(){
		var isdone=false
		isdone=menuthing.kills>=250
		return sign(isdone+unlocked)
	}
}
skinacheivment[2]={
	unlocked: false,
	namey:"Shopping Spree",
	sprite: acheivment23,
	desc:"Buy 10 things from the shop (unlocks Shop guy)",
	func: function(){
		var isdone=false
		isdone=menuthing.thingsbought>=10
		return sign(isdone+unlocked)
	}
}
skinacheivment[3]={
	unlocked: false,
	namey:"bob's apprentice",
	hidden:true,
	sprite: acheivment30,
	desc:"get 300 score in bob vs bots mode (unlocks Bob)",
	func: function(){
		var isdone=false
		isdone=room==secret&&instance_exists(bobplayer)&&bobplayer.scorey>=300
		return sign(isdone+unlocked)
	}
}
skinacheivment[4]={
	unlocked: false,
	hidden:true,
	namey:"botted speedrun",
	sprite: acheivment24,
	desc:"get 500 score in bob vs bots mode (unlocks Bot)",
	func: function(){
		var isdone=false
		isdone=room==secret&&instance_exists(bobplayer)&&bobplayer.scorey>=500
		return sign(isdone+unlocked)
	}
}
skinacheivment[5]={
	unlocked: false,
	sprite: acheivment25,
	namey:"Flabbergastingly Severe Skill Issue",
	desc:"Die with a score of 0. Wow... you suck... (unlocks BeatBoppin Guy) (currently only works correctly with proot songs)",
	func: function(){
		var isdone=false
		isdone=instance_exists(player)&&player.hp<=0&&player.scorey<=0
		return sign(isdone+unlocked)
	}
}
skinacheivment[6]={
	unlocked: false,
	sprite: acheivment32,
	namey:"I AM THE BITCHES",
	desc:"Beat the game one 0 bitches mode (unlocks invazion guy's bitch form. DONT MAKE NSFW ART OF HER WE WILL KILL YOU)",
	func: function(){
		var isdone=false
		isdone=menuthing.finalbossdefeated&&player.ogdifficulty==5
		return sign(isdone+unlocked)
	}
}
skinacheivment[7]={
	unlocked: false,
	hidden: true,
	sprite: acheivment33,
	namey:"Floral Combat!",
	desc:"Activate the spore event (unlocks baseball cap)",
	func: function(){
		var isdone=false
		return sign(isdone+unlocked)
	}
}
skinacheivment[8]={
	unlocked: false,
	namey:"j7unes's tunes",
	desc:"beat the game the way j7unes intended! (unlocks the j7unes skin)",
	sprite: acheivment35,
	func: function(){
		var isdone=false
		isdone=menuthing.musictheme==1&&menuthing.difficulty>=2&&menuthing.floorislava&&menuthing.finalbossdefeated&&!player.gunisnotj7unes
		return sign(isdone+unlocked)
	}
}
skinacheivment[9]={
	unlocked: true,
	namey:"custom skin",
	desc:"100% all unhidden acheivments to unlock!",
	sprite: acheivment22,
	func: function(){
		var isdone=false
		isdone=true
		return sign(isdone+unlocked)
	}
}
load_level()
if(acheivment[20].unlocked)
{
	button[5]={
		name:"BOTS VS BOB MODE",
		func: function(){
			menuthing.botsvsbob=true
		}
	}
}
audio_play_sound(menuthemes[musictheme],1000,true)
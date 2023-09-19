// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function translate_load(){
	global.translation=[]
	var str=load_file("translations.txt")
	if(variable_struct_exists(str,"translations"))
	{
		global.translation=str.translations
	}
	global.languages=global.translation[0]
	global.languageselected=0
}
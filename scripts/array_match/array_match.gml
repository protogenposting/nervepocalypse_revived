// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_match(array1,array2){
	var num=0
	var amount=0
	if(array_length(array1)==array_length(array2))
	{
		repeat(array_length(array1))
		{
			if(array1[num]==array2[num])
			{
				amount+=1
			}
			num+=1
		}
	}
	return array_length(array1)==amount;
}
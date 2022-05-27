// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Settings(){

}

///@description change_difficulty
///@arg value
/*
Examples:
- Changing Variables: health, difficulty, detection radius
- Including/discluding particular AI Abilities
*/
function change_difficulty(){
	var type = menu_option[page];
	
	if (type == 0) { //Difficulty
		switch(argument0) {
			case 0://Easy
			
			break;
			case 1://Normal
			
			break;
			case 2://Hard
			
			break;
		}
	}
	
	/*else { //Maybe in future something.
		
	}*/
}

///@description change_volume
///@arg value
function change_volume(){
	var type = menu_option[page];
	
	switch(type){
		case 0: audio_master_gain(argument0); break; //master
		case 1: audio_group_set_gain(audiogroup_sfx, argument0, 0); break; //sfx
		case 2: audio_group_set_gain(audiogroup_music, argument0, 0); break; //music
	}
}

function change_window_mode() {
	switch(argument0) {
		case 0:
			window_set_fullscreen(true); 
		break;
		
		case 1:
			window_set_fullscreen(false); 
		break;
	}
}

function light_mode() {
	switch(argument0) {
		case 0:
			global.lightswitch = true;
		break;
		
		case 1:
			global.lightswitch = false;
		break;
	}
}

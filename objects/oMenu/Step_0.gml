/// @description Movement in menu
if(!global.pause) exit;

input_up_p = keyboard_check_pressed(ord("W"));
input_down_p = keyboard_check_pressed(ord("S"));
input_enter_p = keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if(inputting) {
	
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.rkey) - keyboard_check_pressed(global.lkey);
			if(hinput != 0){
				//Audio
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) -1);
			}
		break;
		case menu_element_type.slider:
			//Audio
			switch(menu_option[page]){
				//case 0: if(!audio_is_playing(sndOmega)){ audio_play_sound(sndOmega, 1, false); } break;
				case 1: if(!audio_is_playing(sndRunning)){audio_play_sound(sndRunning, 2, false);} break;
				//case 2: if(!audio_is_playing(sound)){} break;
			}
			var hinput = keyboard_check(global.rkey) - keyboard_check(global.lkey);
			if(hinput != 0){
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(global.rkey) - keyboard_check_pressed(global.lkey);
			if(hinput != 0){
				//Audio
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		break;
		case menu_element_type.input:
		var kk = keyboard_lastkey;
		if(kk != vk_enter and ord("Q")) {
			//Audio
			if(kk != ds_grid[# 3, menu_option[page]])
			ds_grid[# 3, menu_option[page]] = kk;
			variable_global_set(ds_grid[# 2, menu_option[page]], kk);
		}
		break;
	}
} else {
	var ochange = input_down_p - input_up_p;
	if(ochange != 0){
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height -1; }
		//Audio
	}
}

if(input_enter_p) {
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if(inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	//Audio
}
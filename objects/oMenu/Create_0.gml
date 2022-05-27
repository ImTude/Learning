/// @description This holds the data

slotSelected = 0;
global.gameSaveSlot = 0;

global.pause = true;

//Global Movement
global.key_enter = vk_enter;
global.key_revert = ord("Q");
global.ukey = ord("W");
global.key_down = ord("S");
global.lkey = ord("A");
global.rkey = ord("D");
global.ekey = ord("C");

//Whenever we change the camera settings GUI changes automatically.
display_set_gui_size(global.view_width, global.view_height);

enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	loadsave,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//Create menu pages
ds_menu_main = create_menu_page(
	["START GAME",	menu_element_type.script_runner, start_game],
	["LOAD GAME",	menu_element_type.script_runner, loadsave_game],
	["SETTINGS",	menu_element_type.page_transfer, menu_page.settings],
	["EXIT",		menu_element_type.script_runner, exit_game]
);

ds_menu_settings = create_menu_page(
	["AUDIO",		menu_element_type.page_transfer, menu_page.audio],
	["DIFFICULTY",	menu_element_type.page_transfer, menu_page.difficulty],
	["GRAPHICS",	menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer, menu_page.controls],
	["BACK",		menu_element_type.page_transfer, menu_page.main],
);

ds_menu_audio = create_menu_page(
	["MASTER",	menu_element_type.slider, change_volume, 1.0, [0,1]],
	["SOUNDS",	menu_element_type.slider, change_volume, 1.0, [0,1]],
	["MUSIC",	menu_element_type.slider, change_volume, 1.0, [0,1]],
	["BACK",	menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_difficulty = create_menu_page(
	["ENEMIES", menu_element_type.shift, change_difficulty, 1, ["EASY", "NORMAL", "HARD"]],
	["BACK",	menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_graphics = create_menu_page(
	["FULLSCREEN", menu_element_type.toggle, change_window_mode, 1, ["WINDOWED", "FULLSCREEN"]],
	["LIGHTING", menu_element_type.toggle, light_mode, 0, ["OFF", "ON"]],
	["BACK",	menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_controls = create_menu_page(
	["JUMP",		menu_element_type.input, "ukey", ord("W")],
	["LEFT",		menu_element_type.input, "lkey", ord("A")],
	["RIGHT",		menu_element_type.input, "rkey", ord("D")],
	["ENTER",		menu_element_type.input, "ekey", ord("C")],
	["ATTACK",		menu_element_type.input, "akey", ord("X")],
	["INVENTORY",	menu_element_type.input, "key_inv", ord("I")],
	["BACK",		menu_element_type.page_transfer, menu_page.settings],
);

//what page are you in
page = 0;
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++
}

for (var _slot = 0; _slot <= 2; _slot++) {
	var _fileName = "save" + string(_slot) + ".sav";
	if (file_exists(_fileName))
	{
		slotData[_slot] = LoadJSONFromFile(_fileName);
	}
	else slotData[_slot] = -1;
}

//Enter
inputting = false;
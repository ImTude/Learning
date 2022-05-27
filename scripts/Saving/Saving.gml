function Saving() {

}

function save_game()
{
	//Create save map
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	_map[? "playerHealth"]	= global.hp;
	_map[? "playerStamina"] = global.stamina;
	_map[? "playerHealthMax"]	= global.maxhp;
	_map[? "playerStaminaMax"] = global.maxstamina;
	_map[? "playerCurrentExp"] = global.currentexp;
	_map[? "playerExpLevel"] = global.exptolevel;
	_map[? "playerLevel"] = global.level;
	_map[? "coppercoin"] = global.coppercoin;
	_map[? "silvercoin"] = global.silvercoin;
	_map[? "goldcoin"] = global.goldcoin;
	
	for (var i = 0;  i < INVENTORY_SLOTS; i++)
	{
		_map[? "inventory"] = global.inventory;
	}
	
	//Save all of this to a string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	//Nuke the data
	ds_map_destroy(_map);
	show_debug_message("Game saved...");
}

function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function loadsave_game()
{
	if (!load_save(global.gameSaveSlot))
	{
		RoomTransition(TRANS_TYPE.FADE, rStringStar);
	} 
	else 
	{
		load_save(global.gameSaveSlot);
		
	}
	show_debug_message("Loading save game");
}

function load_save(_slot)
{
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if (file_exists(_file))
	{
		//Load the game data
		var _json = LoadJSONFromFile(_file);
		
		//global variables
		global.hp = _json[? "playerHealth"];
		global.maxhp = _json[? "playerHealthMax"];
		global.stamina = _json[? "playerStamina"];
		global.maxstamina = _json[? "playerStaminaMax"];
		global.currentexp = _json[? "playerCurrentExp"];
		global.exptolevel = _json[? "playerExpLevel"];
		global.level = _json[? "playerLevel"];
		global.coppercoin = _json[? "coppercoin"];
		global.silvercoin = _json[? "silvercoin"];
		global.goldcoin = _json[? "goldcoin"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		
		for (var i = 0;  i < INVENTORY_SLOTS; i++)
		{
			global.inventory = _json[? "inventory"];
		}
		
		//Room
		RoomTransition(TRANS_TYPE.FADE, _json[? "room"]);
		
		ds_map_destroy(_json);
		
		return true;
	}
	else
	{
		show_debug_message("no save in this file");
		return false;
	}
}

function LoadJSONFromFile(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}

function RoomToAreaName(_room)
{
	switch(room)
	{
		case rStringStar: return "String Stars"; break;
		case rKForest: return "Killua Forest"; break;
		default: return "Unknown Area"; break;
	}
}
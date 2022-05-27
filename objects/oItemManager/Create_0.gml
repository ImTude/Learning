/// @description Create
depth = -99;

global.openInv = false;
global.armorInv = false;

function create_item(_name, _desc, _spr) constructor
{
	name = _name;
	description = _desc;
	sprite = _spr;
}

global.item_list =
{
#region Armor
	bhelm: new create_item(
	"Bronze Helmet",
	"Very helpful helmet, Bronze Helmet.",
	sBHelm
	),
	shelm: new create_item(
	"Silver Helmet",
	"Better than Bronze Helmet.",
	sSHelm
	),
	ghelm: new create_item(
	"Golden Helmet",
	"",
	sGHelm
	),
	diahelm: new create_item(
	"Diamond Helmet",
	"",
	sDiaHelm
	),
	dhelm: new create_item(
	"Dragon Helmet",
	"",
	sDHelm
	),
	
	bshield: new create_item(
	"Bronze Shield",
	"",
	sBShield
	),
	gshield: new create_item(
	"Golden Shield",
	"",
	sGShield
	),
	diashield: new create_item(
	"Diamond Shield",
	"",
	sDiaShield
	),
	dshield: new create_item(
	"Dragon Shield",
	"",
	sDShield
	),
	
	bsword: new create_item(
	"Bronze Sword",
	"",
	sBSword
	),
	sword: new create_item(
	"Silver Sword",
	"",
	sSSword
	),
	gsword: new create_item(
	"Golden Sword",
	"",
	sGSword
	),
	diasword: new create_item(
	"Diamond Sword",
	"",
	sDiaSword
	),
	dsword: new create_item(
	"Dragon Sword",
	"",
	sDSword
	),
#endregion
}

//create the inventory
rowLenght = 5;
global.inventory = array_create(INVENTORY_SLOTS, -1);
inventory = global.inventory;
selected_item = 0;
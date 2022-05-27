function item_add(_item)
{
	array_push(oItemManager.inventory, _item);
}

function InventorySearch(rootObject,itemType)
{
	for (var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		if (rootObject.inventory[i] == itemType)
		{
			return(i);
		}
	}
	return(-1);
}

function InventoryRemove(rootObject,itemType)
{
	var _slot = InventorySearch(rootObject,itemType);
	if (_slot != -1)
	{
		with (rootObject) inventory[_slot] = -1;
		return true;
	}
	else return false;
}

function InventoryAdd(rootObject,itemType)
{
	var _slot = InventorySearch(rootObject,-1);
	if (_slot != -1)
	{
		with (rootObject) inventory[_slot] = itemType;
		return true;
	}
	else return false;
}

function ItemCollision()
{
	vsp = vsp + grv;
	//Vertical Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}
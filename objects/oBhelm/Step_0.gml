/// @description Step

//This is the way to change a object inside a room, 
//instance code for the object is "item = global.item_list.NAME"

sprite_index = item.sprite;

if (place_meeting(x,y,oPlayer))
{
	//item_add(item);
	InventoryAdd(oItemManager, item);
	instance_destroy();
}

//Vertical Collision
ItemCollision();
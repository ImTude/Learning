if (room = rMenu) {
	//Nothing
}
else 
if (keyboard_check_pressed(ord("I"))) {
	global.openInv = !global.openInv;
	global.armorInv = !global.armorInv;
}

//Cycle
if (global.openInv = true) {
	if (keyboard_check_pressed(ord("D"))) {
		if (selected_item + 1) <= (INVENTORY_SLOTS - 1) {
			selected_item ++;
		}
		else
		{
			selected_item = 0;
		}
	}

	if (keyboard_check_pressed(ord("A"))) {
		if (selected_item - 1) >= 0 {
			selected_item --;
		}
		else
		{
			selected_item = (INVENTORY_SLOTS - 1);
		}
	}
}

//Destroy
if (global.openInv = true) {
	if (keyboard_check_pressed(ord("Q"))) {
		item = inventory[selected_item];
		InventoryRemove(oItemManager, item);
	}
}

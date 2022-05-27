/// @description Draw
draw_set_font(fntItems);

	if (room = rMenu) {
		//Nothing
	}
	else
	if (global.openInv == true)
	{
		//Draw Alpha Behind every thing
		draw_set_color(c_black);
		draw_set_alpha(0.45);
		draw_rectangle(0,0, global.view_width, global.view_height, false);
		draw_set_alpha(1.0);
		draw_set_color(c_white);
		
		//Draw the coins
			draw_set_font(fntHealth);
		//Copper
			draw_sprite(sCopperCoin, image_index / 7, 359, 217);
			draw_text(373, 220, string(global.coppercoin));
		//Silver
			draw_sprite(sSilverCoin, image_index / 7, 329, 217);
			draw_text(343, 220, string(global.silvercoin));
		//Gold
			draw_sprite(sGoldCoin, image_index / 7, 298, 217);
			draw_text(313, 220, string(global.goldcoin));
		
		for (var i = 0; i < INVENTORY_SLOTS; i += 1)
		{
			//Draw the Inventory sprites
			var xx = x - 115 + (i mod rowLenght) * 28;
			var yy = y + 50 + (i div rowLenght) * 28;

			var _col = c_orange;
			
			//Draws the squares
			draw_sprite(sInvSlot, 0, xx, yy);
	
			//When you get the item
			if (inventory[i] != -1)
			{
				//Draw items
				draw_sprite(inventory[i].sprite, 0, xx, yy);
				
				if (selected_item == i)
				{
					draw_sprite(sInvSlotHover, 0, xx, yy);
					draw_text_color(xx, yy, inventory[i].name, _col,_col,_col,_col, 1.0);
				}
				
				//Desc
				//draw_text_ext(x - _yy, y, inventory[i].description, 8, 80);
				
				//reset the color
				draw_set_color(c_white);

			}
		}
		
	}
	else
	{
		//openInv == false;
	}

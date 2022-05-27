/// @description Draw on the screen
if(!global.pause) exit;
var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 22, x_buffer = 8;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x = gwidth/2;

//Background
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0, global.view_width, global.view_height, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	
//Draw Elements on left side
#region Left Side
draw_set_font(fntMenu);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo;

var yy = 0; 
repeat(ds_height) 
{
	lty = start_y + (yy*y_buffer);
	c = c_white;
	alph = 0.3;
	xo = 0;
	
	if(yy == menu_option[page])
	{
		c = c_orange;
		alph = 1.0;
		xo = -(x_buffer*0.2);
	}
	
	if (page >= 2)
	{
		//Page = 2 and Up only
		draw_text_color(ltx, lty+xo, ds_grid[#0, yy], c,c,c,c, alph);
	}
	else
	{
		//Page = 0 and Page = 1 only (Main + Settings)
		draw_set_valign(fa_middle);
		draw_set_halign(fa_middle);
		draw_text_color(ltx, lty+xo, ds_grid[# 0, yy], c,c,c,c, alph);
	}
	yy++;
}
#endregion

draw_set_font(fntMenu);

//Draw Dividing Line
if (page > 1)
{
	draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);
} else {
	//Don't
}

//Draw Elements on right side
#region Right Side
draw_set_halign(fa_left);
var rtx = start_x + x_buffer, rty;

	var yy = 0; repeat(ds_height) {
	rty = start_y + (yy*y_buffer);
		
	switch(ds_grid[# 1, yy]) {
		 case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			c = c_white;
			
			if (current_val == 0)
			{
				left_shift = "";
			}
			
			if (current_val == array_length_1d(ds_grid[# 4, yy])-1)
			{
				right_shift = "";
			}
			
			if(inputting and yy == menu_option[page])
			{ 
				c = c_yellow; 
			}
			draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift, c,c,c,c, 1);
		break;
		
		case menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_white;
			
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			
			if(inputting and yy == menu_option[page])
			{ 
				c = c_yellow; 
			}
			
			draw_circle_color(rtx + (circle_pos*len), rty, 4, c,c, false);
			//draw_sprite(sMenuSlider, 0, rtx + (circle_pos*len), rty);
			
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos*100))+"%", c,c,c,c, 1);
		break;
		
		case menu_element_type.toggle:
			c = c_white;
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			if(inputting and yy == menu_option[page]) 
			{
				c = c_yellow;
			}
			
			if (current_val == 0)
			{ 
				//ON image_index = 1
				c1 = c;
				c2 = c_dkgray;
			}
			else
			{ 
				//OFF image_index = 0
				c1 = c_dkgray; 
				c2 = c;
			}
			
			//draw_sprite(sprite_index, image_index, rtx, rty - 18);
			
			draw_text_color(rtx, rty, "ON", c1,c1,c1,c1, 0.5);
			draw_text_color(rtx + 32, rty, "OFF", c2,c2,c2,c2, 0.5);
		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			
			switch(current_val){
				case ord("W"):		string_val = "W"; break;
				case ord("A"):		string_val = "A"; break;
				case ord("D"):		string_val = "D"; break;
				case ord("X"):		string_val = "X"; break;
				case ord("I"):		string_val = "I"; break;
				default:			string_val = chr(current_val); break;
			}
			c = c_white;
			if(inputting and yy == menu_option[page])
			{ 
				c = c_yellow; 
			}
			
			draw_text_color(rtx, rty, string_val, c,c,c,c, 1);
		break;
	}
	yy++;
}
#endregion

draw_set_valign(fa_top);

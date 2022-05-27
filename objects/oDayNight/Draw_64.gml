/// @description Draw
if (room == rMenu)
{
 //Empty	
}
else
{
	if(draw_daylight) {
		var c = light_color;
		draw_set_alpha(darkness);
		draw_rectangle_color(0,0, guiWidth, guiHeight, c,c,c,c, false);
		draw_set_alpha(1);
	}

	draw_set_font(fntMenuDesc);
	var c = c_white;
	if (hours > phase.sunrise and hours <= phase.daytime)
	{
		draw_sprite(sDayNight, 0, 610, 24);
		draw_text_color(610, 47, "Sunrise", c,c,c,c, 1);
	} 
	else if (hours > phase.daytime and hours <= phase.sunset)
	{
		draw_sprite(sDayNight, 1, 610, 24);
		draw_text_color(610, 47, "Day", c,c,c,c, 1);
	}
	else if (hours > phase.sunset and hours <= phase.nighttime)
	{
		draw_sprite(sDayNight, 2, 610, 24);
		draw_text_color(610, 47, "Sunset", c,c,c,c, 1);
	}
	else
	{
		draw_sprite(sDayNight, 3, 610, 24);
		draw_text_color(610, 47, "Night", c,c,c,c, 1);
	}
}
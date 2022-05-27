/// @description Variables
//Per Room
draw_daylight = false;

seconds = 0;
minutes = 0;
hours = 8;

day = 1;
month = 1;
year = 1;

time_increment = 15; //seconds per step

darkness = 0;
max_darkness = 0.5;
light_color = c_black;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

enum phase {
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 23,
}
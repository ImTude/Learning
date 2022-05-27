/// @description 
if (room == rMenu) or (global.gamepause == true) {
	//Nothing
}
else
{
	
// Increment Time
seconds += time_increment;
minutes = seconds/60;
hours = minutes/60;

//darkness = hours/24;

if (draw_daylight) {
	#region Phases and Variables
	var _dark, _col, pstart, pend;
	if (hours > phase.sunrise and hours <= phase.daytime) {			//Sunrise
		_dark	= [max_darkness, 0.2];
		_col	= [merge_color(c_black,c_navy,0.3), c_orange];
		pstart	= phase.sunrise;
		pend	= phase.daytime;
	} else if (hours > phase.daytime and hours <= phase.sunset) {	//Day
		_dark	= [0.2, 0, 0, 0, 0.2];
		_col	= [c_orange, c_orange, c_white, c_orange, c_orange];
		pstart	= phase.daytime;
		pend	= phase.sunset;
	} else if (hours > phase.sunset and hours <= phase.nighttime) {	//Sunset
		_dark	= [0.2, max_darkness];
		_col	= [c_orange, merge_color(c_black, c_navy, 0.3)];
		pstart	= phase.sunset;
		pend	= phase.nighttime;
	} else {
		_dark	= [max_darkness];
		_col	= [merge_color(c_black,c_navy,0.3)];
		pstart	= phase.nighttime;
		pend	= phase.sunrise;
	}
	#endregion
	//--------------------------
	#region Alter Darkness & Colours Depending on Time
	//Colours
	if (pstart == phase.nighttime) { light_color = _col[0]; }
	else {
		var cc = ((hours - pstart) / (pend - pstart))*(array_length_1d(_col)-1);
		var c1 = _col[floor(cc)];
		var c2 = _col[ceil(cc)];
	
		light_color = merge_color(c1, c2, cc-floor(cc));
	}
	//Darkness
	if (pstart == phase.nighttime) { darkness = _dark[0]; }
	else {
		var dd = ((hours - pstart) / (pend - pstart))*(array_length_1d(_dark)-1);
		var d1 = _dark[floor(dd)];
		var d2 = _dark[ceil(dd)];
	
		darkness = merge_number(d1, d2, cc-floor(dd));
	}
	#endregion
}

#region Cycle Check
if(hours >= 24)
{
	seconds = 0;
	day += 1;
	
	if(day > 30) {
		day = 1;
		month += 1;
		
		if(month > 12) {
			month = 1;
			year += 1;
		}
	}
}
#endregion
}
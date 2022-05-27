// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	//Horizontal Collision
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	//Vertical Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		if(vsp > 0) {
	        jump_current = jump_number;
	    }
		vsp = 0;
	}
	y += vsp;
}
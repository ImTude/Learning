// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	if (global.gamepause) {
		image_speed = 0;
	} else {
	//Sprites
	if (!place_meeting(x, y+1, oWall)) {
		sprite_index = sPlayer_jump;
		image_speed = 1; //Multiplies the speed in the Sprite itself.
		if (sign(vsp) > 0) {
			sprite_index = sPlayer_fall;
			image_speed = 1;
			audio_pause_sound(sndRunning);
		} else {
			image_speed = 0;	
		}
	} else {
		image_speed = 1;
		if (hsp == 0) {
			sprite_index = sPlayer_Idle;
		} else {
			sprite_index = sPlayer_run;
		}
	}

	if (hsp != 0) {
		image_xscale = sign(hsp);
	}
	}
}
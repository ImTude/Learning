// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free() {
	
	if (global.gamepause) or (global.openInv) {
		//Paused
	} else {
	
//Calculate Movement
var move = (global.rkey - global.lkey);
hsp = move * walksp; //approach(walksp, move, accel);
vsp = vsp + grv;

if (global.runkey) and (global.stamina > 0) {
	walksp = 3.5;
	global.stamina -=  0.20;
} else {
	walksp = 2.5;
}
if !(global.runkey) {
	global.stamina += 0.05;
}
if (global.stamina > global.maxstamina) {
	global.stamina = global.maxstamina;
}
if (global.stamina < 0) {
	global.stamina = 0;
}

//Jumping
if (place_meeting(x, y+1, oWall)) {
	jump_current = jump_number;
}

if (global.ukey) and (jump_current > 0) {
	jump_current--;
	vsp = -5.5;
}

PlayerCollision();

PlayerAnimateSprite();

	if (global.akey) and (sprite_index != sPlayer_fall) and (sprite_index != sPlayer_jump) {
		state = PLAYERSTATE.ATTACK_SLASH;
		audio_pause_sound(sndRunning);
	}
	}
}
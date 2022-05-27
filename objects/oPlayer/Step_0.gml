/// @description Movement
global.lkey = keyboard_check(ord("A"));
global.rkey = keyboard_check(ord("D"));
global.ukey = keyboard_check_pressed(ord("W"));
global.downkey = keyboard_check_pressed(ord("S"));
global.akey = keyboard_check_pressed(ord("X"));
global.runkey = keyboard_check(vk_lshift);

global.ekey = keyboard_check_pressed(ord("C"));
global.enter = keyboard_check_pressed(vk_enter);
global.backkey = keyboard_check_pressed(vk_escape);

//Switch to a Script
switch (state) {
	case PLAYERSTATE.FREE:			PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_SLASH:	PlayerState_Attack_Slash(); break;
	case PLAYERSTATE.ATTACK_COMBO:	PlayerState_Attack_Combo(); break;
	case PLAYERSTATE.ATTACK_SPIN:	PlayerState_Attack_Spin(); break;
	case PLAYERSTATE.DEAD:			PlayerStateDead(); break;
	case PLAYERSTATE.TRANSITION:	PlayerStateTransition(); break;
}

if (!global.gamepause)
{
	//script_execute(state);
	invulnerable = max(invulnerable-1,0);
	flash = max(flash-0.05,0);
}

if (global.currentexp > global.exptolevel) {
	global.level += 1;
	global.currentexp = 0;
	global.exptolevel = 60 * global.level;
	global.maxstamina += 2;
	global.maxhp += 2;
}

if (global.coppercoin = 30) {
	global.silvercoin += 1;
	global.coppercoin = 0;
}
else if (global.silvercoin = 30) {
	global.goldcoin += 1;
	global.silvercoin = 0;
}

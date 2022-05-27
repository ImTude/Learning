/// @description Variables
vsp = 0;
hsp = 0;
grv = 0.3;
walksp = 2.5;
accel = 0.3;

invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

jump_number = 2; //How many jumps the player can make
jump_current = 0; //How many jumps the player has remaining

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

//Enum
enum PLAYERSTATE {
		FREE,
		ATTACK_SLASH,
		ATTACK_COMBO,
		ATTACK_SPIN,
		DEAD,
		TRANSITION
}
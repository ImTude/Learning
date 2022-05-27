function ProcessAttack() {
	//Start of the Attack
	if (sprite_index != argument[0]) {
		sprite_index = argument[0];
		image_speed = 1;
		ds_list_clear(hitByAttack);
	}
	//Use attack hitbox
	mask_index = argument[1];
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oEnemies, hitByAttackNow, false);
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
		//If this instance has not yet been hit by this attack
		var hitID = hitByAttackNow[| i];
		if (ds_list_find_index(hitByAttack, hitID) == -1) {
			ds_list_add(hitByAttack, hitID);
			with (hitID)
			{
				//Do what you want for the objects hit by
				if (object_is_ancestor(object_index, oEnemies)) {
					HurtEnemy(id, 5, other.id, 10);
				} else EnemyHit(1);
			}
		}
	}
}
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer_Idle;
}

function HurtEnemy(_enemy, _damage, _source, _knockback) {
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemyHp -= _damage;
			flash = 1;
			image_speed = 1.0;
			sprite_index = sprHurt;
			
			//Hurt or dead
			if (enemyHp <= 0) {
				state = ENEMYSTATE.DIE;
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0) {
				var _knockdir = point_direction(x,y,(_source).x,(_source).y);
				xTo = x - lengthdir_x(_knockback, _knockdir);
				yTo = y - lengthdir_y(_knockback, _knockdir);
			}
		}
	}
}

function PlayerState_Attack_Slash() {
hsp = 0;
vsp = 0;
	
	ProcessAttack(sPlayerAttack1,sPlayerAttack1Mask);
	
	//Trigger Combo Chain
	if (global.akey) && (image_index > 3) {
		image_index = 1;
		state = PLAYERSTATE.ATTACK_COMBO;
	}
	
	if (animation_end()) {
		sprite_index = sPlayer_Idle;
		image_index = 1;
		state = PLAYERSTATE.FREE;
	}
}

function PlayerState_Attack_Combo(){
hsp = 0;
vsp = 0;
	
	ProcessAttack(sPlayerAttack2,sPlayerAttack2Mask);
	
		//If you want to continue the attacks
	if (global.akey) && (image_index > 3) {
		image_index = 1;
		state = PLAYERSTATE.ATTACK_SPIN;
	}
	
	if (animation_end()) {
		sprite_index = sPlayer_Idle;
		image_index = 1;
		state = PLAYERSTATE.FREE;
	}
}

function PlayerState_Attack_Spin() {
hsp = 0;
vsp = 0;
	
	ProcessAttack(sPlayerAttack3,sPlayerAttack3Mask);
	
	if (animation_end()) {
		sprite_index = sPlayer_Idle;
		image_index = 1;
		state = PLAYERSTATE.FREE;
	}
}
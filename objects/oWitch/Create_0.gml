///@desc Enemy Variables
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove0 = sWitchWalk;
sprAttack = sWitchThrow;
sprDie = sWitchDeath;
sprHurt = sWitchHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = WitchWander;
enemyScript[ENEMYSTATE.CHASE] = WitchChase;
enemyScript[ENEMYSTATE.ATTACK] = WitchAttack;
enemyScript[ENEMYSTATE.HURT] = WitchHurt;
enemyScript[ENEMYSTATE.DIE] = WitchDie;
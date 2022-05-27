///@desc Enemy Variables
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove0 = sBatFly;
sprAttack = sBatAttack;
sprDie = sBatDeath;
sprHurt = sBatHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = BatWander;
enemyScript[ENEMYSTATE.CHASE] = BatChase;
enemyScript[ENEMYSTATE.ATTACK] = BatAttack;
enemyScript[ENEMYSTATE.HURT] = BatHurt;
enemyScript[ENEMYSTATE.DIE] = BatDie;
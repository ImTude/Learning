/// @description Enemy Variables
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove0 = sWolfRun;
sprAttack = sWolfAttack;
sprAttackMask = sWolfAttackMask;
sprDie = sWolfDeath;
sprHurt = sWolfHurt;

enemyScript[ENEMYSTATE.WANDER] = WolfWander;
enemyScript[ENEMYSTATE.CHASE] = WolfChase;
enemyScript[ENEMYSTATE.ATTACK] = WolfAttack;
enemyScript[ENEMYSTATE.HURT] = WolfHurt;
enemyScript[ENEMYSTATE.DIE] = WolfDie;
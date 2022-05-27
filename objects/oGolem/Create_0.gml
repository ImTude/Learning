///@desc Enemy Variables
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove0 = sGolemWalk;
sprAttack = sGolemAttack;
sprAttackMask = sGolemAttackMask;
sprDie = sGolemDeath;
sprHurt = sGolemHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = GolemWander;
enemyScript[ENEMYSTATE.CHASE] = GolemChase;
enemyScript[ENEMYSTATE.ATTACK] = GolemAttack;
enemyScript[ENEMYSTATE.HURT] = GolemHurt;
enemyScript[ENEMYSTATE.DIE] = GolemDie;
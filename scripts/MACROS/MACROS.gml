function MACROS(){
	#macro TRANSITION_SPEED 0.015
	#macro OUT 0
	#macro IN 1
	#macro INVENTORY_SLOTS 20
	
	enum ENEMYSTATE //TOP 0 -->
	{
		IDLE,
		WANDER,
		CHASE,
		ATTACK,
		HURT,
		DIE,
		WAIT
	}

	enum ITEMTYPE //TOP 0 -->
	{
		HELM,
		SWORD,
		SHIELD,
		RING,
		NECK
	}
}
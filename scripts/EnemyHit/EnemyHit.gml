///@description EnemyHit
///@arg DamageValue
function EnemyHit() {
	
	var _damage = argument[0];

	enemyHp -= _damage;

	with(oEnemies)
	{
		if (enemyHp < 0) {
			instance_destroy();
		}
		
	}
	
}
function HurtPlayer(_direction,_force,_damage) {
	if (oPlayer.invulnerable <= 0)
	{
		global.hp = max(0, global.hp-_damage);
		
		if (global.hp > 0)
		{
			with (oPlayer)
			{
				direction = _direction-180;
				flash = 0.7;
				flashShader = shRedFlash;
				invulnerable = 60;
			}
		}
		else
		{
			with(oPlayer) state = PLAYERSTATE.DEAD;
		}
	}
}
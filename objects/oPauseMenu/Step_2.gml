/// @description End
if (keyboard_check_pressed(vk_escape))
{
	if (room = rMenu) or (oPlayer.state == PLAYERSTATE.DEAD) or (oPlayer.state == PLAYERSTATE.TRANSITION)
	{
		//Nothing
	}
	else
	{
		global.gamepause = !global.gamepause;
	
		if (global.gamepause)
		{
			with (all)
			{
				image_speed = 0;
				gamePausedImageSpeed = image_speed;
			}
		}
		else
		{
			with (all)
			{
				image_speed = gamePausedImageSpeed;
			}
		}
	}
}
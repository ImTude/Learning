function PlayerStateDead() 
{
	hsp = 0;
	
	//if just arriving in this state
	if (sprite_index != sPlayer_hurt) and (sprite_index != sPlayer_die)
	{
		//update the sprite
		sprite_index = sPlayer_hurt;
		image_index = 0;
		image_speed = 1.0;
	}
	
	//Animation ending this frame?
	if (image_index + image_speed > image_number) 
	{
		if (sprite_index == sPlayer_hurt)
		{
			image_speed = max(0, image_speed-0.04);
			if (image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = sPlayer_die;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number-1;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.SLIDE, room);
		}
	}
}
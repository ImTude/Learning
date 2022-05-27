if (place_meeting(x,y,oPlayer)) and (keyboard_check_pressed(ord("C"))) 
{
	if (!instance_exists(oTransition)) and (oPlayer.state != PLAYERSTATE.DEAD)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.direction;
		with (oPlayer) state = PLAYERSTATE.TRANSITION;
		RoomTransition(TRANS_TYPE.FADE, targetRoom);
		instance_destroy();
	}
}
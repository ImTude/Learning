/// @description Room Change
if (instance_exists(oPlayer)) and (position_meeting(oPlayer.x, oPlayer.y, id))
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
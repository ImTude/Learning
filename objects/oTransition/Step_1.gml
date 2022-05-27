/// @description Progress Transition
with (oPlayer) {
	if (state != PLAYERSTATE.DEAD) state = PLAYERSTATE.TRANSITION;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) //If screen fully obscured
	{
		room_goto(target);
		leading = IN;
	}
}
else //Leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) //If screen fully revealed
	{
		with (oPlayer) state = PLAYERSTATE.FREE;
		instance_destroy();	
	}
}
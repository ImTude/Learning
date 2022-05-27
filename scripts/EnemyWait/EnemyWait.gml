///@desc Simple if enemy attacks this uses to go to other scripts
function EnemyWait() {
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0;
		state = stateTarget;
	}
}
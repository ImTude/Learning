

function WitchWander() {
	sprite_index =  sprMove0;
	//At destination or given up
	if ((x == xTo) and (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hsp = 0;
		vsp = 0;
		if (image_index < 14)
		{
			image_speed = 1.0;
			sprite_index = sWitchIdle;
		}
		//Set new destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-74,74);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			//yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} 
	else
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_speedThisFrame,dir);
		//vsp = lengthdir_y(_speedThisFrame,dir);
		if (hsp != 0) image_xscale = sign(hsp);
		
		//Collide & move
		EnemyTileCollision();
	}
	
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer)) && (point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
}

function WitchChase() {
	sprite_index = sprMove0;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed)
		{
			hsp = lengthdir_x(enemySpeed, dir);
			//vsp = lengthdir_y(enemySpeed, dir);
		} else {
			hsp = lengthdir_x(_distanceToGo, dir);
			//vsp = lengthdir_y(_distanceToGo, dir);
		}
		if (hsp != 0) image_xscale = sign(hsp);
		//Collide & Move
		EnemyTileCollision();
	}
	
	//Check if close enough to launch attack
	if (instance_exists(target)) and (point_distance(x, y, target.x, target.y,) <= enemyAttackRadius) {
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1;
		//Target px past the player
		xTo += lengthdir_x(24, dir);
		yTo += lengthdir_y(24, dir);
	}
}

function WitchAttack() {
	//How fast to move
	var _spd = enemySpeed;
	
	//Don't move while still getting ready to jump
	if (image_index < 9) _spd = 0;
	
	//Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 10) or (floor(image_index) == 11) image_speed = 1;
	
	//How far we have to jump
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	//Begin landing end of the animation once we're nearly done
	if (_distanceToGo < 4) and (image_index < 13) image_speed = 1.0;
	
	//Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_spd, dir);
		vsp = _spd; //lengthdir_y(_spd, dir);
		if (hsp != 0) image_xscale = sign(hsp);
		
		//Commit to move and moving if we hit a wall
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if (floor(image_index) == 1)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 5;
			state = ENEMYSTATE.WAIT;
		}
	}
}

function WitchHurt() {
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) image_xscale = -sign(hsp);
		
		//Collide and Move, stop knockback
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
}

function WitchDie() {
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) image_xscale = -sign(hsp);
		
		//Collide and Move
		EnemyTileCollision();
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}
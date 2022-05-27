//ItemCollision();
if (global.gamepause == true) {
	move_towards_point(oPlayer.x, oPlayer.y, 0);
	image_speed = 0;
}
else if (global.gamepause == false)
{
	move_towards_point(oPlayer.x, oPlayer.y, 1.5);
	image_speed = 1.0;
}

if (place_meeting(x, y, oPlayer))
{
	global.coppercoin += 1;
	instance_destroy();
}
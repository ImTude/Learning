// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision() {
	
var _collision = false;
if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	_collision = true;
}
x += hsp;

if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x,y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	_collision = true;
}
y += vsp;

return _collision;
}
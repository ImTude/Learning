/// @description Progress Text
letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fnt);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy
if (letters >= lenght) 
	and (keyboard_check_pressed(vk_anykey))
	or (oPlayer.state = PLAYERSTATE.TRANSITION)
	or (oPlayer.state = PLAYERSTATE.DEAD)
{
	instance_destroy();
	with (oCamera) follow = oPlayer;
}

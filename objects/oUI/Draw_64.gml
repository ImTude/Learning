/// @description Drawing
if (room = rMenu) {
	//Nothing
}
else
{
	var c = c_white;
	draw_set_font(fntHealth);
	//Health
	draw_sprite(sBarBg, 0, healthbar_x, healthbar_y);
	draw_sprite_stretched(sHealthbarFill, 0, healthbar_x, healthbar_y, min((global.hp/global.maxhp) * healthbar_width, healthbar_width), healthbar_height);
	draw_sprite(sBarBorder, 0, healthbar_x, healthbar_y);

	//Stamina
	draw_sprite(sBarBg, 0, staminabar_x, staminabar_y);
	draw_sprite_stretched(sStaminabarFill, 0, staminabar_x, staminabar_y, min((global.stamina/global.maxstamina) * healthbar_width, healthbar_width), healthbar_height);
	draw_sprite(sBarBorder, 0, staminabar_x, staminabar_y);

	//Heart
	draw_sprite(sHeartAnimation, 0, staminabar_x - 15, staminabar_y - 0.5);
	draw_text(staminabar_x - 15, staminabar_y + 3, string(global.level));
	
	//Exp
	draw_sprite(sBarBg, 0, expbar_x, expbar_y);
	draw_sprite_stretched(sExpbarFill, 0, expbar_x, expbar_y, min((global.currentexp/global.exptolevel) * healthbar_width, healthbar_width), healthbar_height);
	draw_sprite(sBarBorder, 0, expbar_x, expbar_y);
}
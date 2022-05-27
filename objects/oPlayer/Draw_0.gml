/// @description Draw
if (invulnerable != 0) and ((invulnerable mod 6 < 2) == 0) and (flash == 0)
{
	//skip draw
} 
else {
	
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	
	draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	)
	
	if (shader_current() != -1) shader_reset();
	
}

draw_set_font(fntMenuDesc);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
draw_text(oPlayer.x, oPlayer.y - 45, "state: "+ string(state));
draw_text(oPlayer.x, oPlayer.y - 30, "fps: "+ string(fps));

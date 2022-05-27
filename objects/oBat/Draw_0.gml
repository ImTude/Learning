if (flash != 0)
{
	shader_set(shWhiteFlash);
	wFlash = shader_get_uniform(shWhiteFlash, "flash");
	shader_set_uniform_f(wFlash, flash);
}

draw_sprite_ext(sprite_index,
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
flash = 0;
/// @description animation_end(sprite_index,image_index, rate)
/// @param {real} <sprite_index> The index of the sprite being animated
/// @param {real} <image_index> The current frame value
/// @param {real} <rate> -See Below-
function animation_end(){

var _sprite=sprite_index;
var _image=image_index;
if(argument_count > 0)	 _sprite=argument0;
if(argument_count > 1)	_image=argument1;
var _type=sprite_get_speed_type(sprite_index);
var _spd=sprite_get_speed(sprite_index)*image_speed;
if(_type == spritespeed_framespersecond)
	_spd = _spd/room_speed;
if(argument_count > 2) _spd=argument2;
return _image+_spd >= sprite_get_number(_sprite);

}
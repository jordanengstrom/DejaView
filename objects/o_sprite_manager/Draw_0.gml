if (count < global.max_index && duration < frames) {
    var _obj = global.game_solution[count];
	sprite_index = object_get_sprite(_obj);
	draw_sprite_stretched(sprite_index, 0, 135, 135, 256, 256);
}
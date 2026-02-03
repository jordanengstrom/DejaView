if (count < global.max_index && duration < frames) {
    var _obj = global.game_solution[count];
	sprite_index = object_get_sprite(_obj);
	
	var _margin = 20;
    var _frame_x = _margin;
    var _frame_y = _margin;
    var _frame_w = room_width - (_margin * 2);
    var _frame_h = room_height - (_margin * 2);
	
	var _img_size = 256;
    var _final_x = _frame_x + (_frame_w - _img_size) / 2;
    var _final_y = _frame_y + (_frame_h - _img_size) / 2;
	
	draw_sprite_stretched(sprite_index, 0, _final_x, _final_y, _img_size, _img_size);
}
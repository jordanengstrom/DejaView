var _margin = 20;
var _x = _margin;
var _y = _margin;
var _width = room_width - (_margin * 2);  // 375 - 40 = 335
var _height = room_height - (_margin * 2); // 584 - 40 = 544

draw_sprite_stretched(s_card_frame, 0, _x, _y, _width, _height);
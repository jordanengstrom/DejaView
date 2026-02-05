var _margin = 20;
var _x = _margin;
var _y = _margin;
var _width = room_width - (_margin * 2);
var _height = room_height - (_margin * 2);
var _radius = 24;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _body_color = make_color_rgb(127, 166, 255);
draw_set_color(_body_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, false);

var _margin = 50;
var _x = _margin;
var _y = _margin + 350;
var _width = room_width - (_margin * 2);
var _height = 50;
var _radius = 24;

var _shadow_color = make_colour_rgb(79, 65, 0);
draw_set_color(_shadow_color);
draw_roundrect_ext(_x + 6, _y + 8, _x + _width + 6, _y + _height + 8, _radius, _radius, false);

var _body_color = make_colour_rgb(211, 175, 0);
var _hover = point_in_rectangle(mouse_x, mouse_y, _x, _y, _x + _width, _y + _height);
var _click = _hover && mouse_check_button_released(mb_left);

if (_click) {
    room_goto(r_lobby);
} else if (_hover) {
	_body_color = make_colour_rgb(255, 221, 57);
}

draw_set_color(_body_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, false);


draw_set_color(_shadow_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, true);

var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_verdana_bold_13);
draw_set_color(c_black);
draw_text(_center_x, _center_y, "Replay");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
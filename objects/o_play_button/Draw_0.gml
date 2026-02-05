var _x = 20;
var _y = 315;

var _width = 335;
var _height = 50;
var _radius = 24;

var _shadow_color = make_colour_rgb(79, 65, 0);
var _body_color = make_colour_rgb(211, 175, 0);

draw_set_color(_shadow_color);
draw_roundrect_ext(_x + 6, _y + 8, _x + _width + 6, _y + _height + 8, _radius, _radius, false);

var _hover = point_in_rectangle(mouse_x, mouse_y, _x, _y, _x + _width, _y + _height);
var _click = _hover && mouse_check_button(mb_left);

if (_click) {
    _body_color = merge_colour(_body_color, c_black, 0.1);
	room_goto(r_main);

} else if (_hover) {
	_body_color = make_colour_rgb(255, 221, 57);
}

draw_set_color(_body_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, false);

var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_verdana_bold_13);
draw_set_color(c_black);
draw_text(_center_x, _center_y, "Play");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _width = 100;
var _height = 50;
var _radius = 24;

var _x1 = 247 - (_width / 2);
var _y1 = 495 - (_height / 2);
var _x2 = _x1 + _width;
var _y2 = _y1 + _height;

var _shadow_color = make_colour_rgb(15, 6, 45);
draw_set_color(_shadow_color);
draw_roundrect_ext(_x1 + 6, _y1 + 8, _x2 + 6, _y2 + 8, _radius, _radius, false);

var _body_color = make_colour_rgb(136, 124, 175);

var _hover = point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2);
var _click = _hover && mouse_check_button(mb_left);

var _is_disabled = true;
if (variable_global_exists("user_selection")) {
    _is_disabled = (array_length(global.user_selection) <= 1);
}


if (_is_disabled) {
    _body_color = c_gray;
	_shadow_color = c_ltgray;
	draw_set_colour(_shadow_color)
	draw_roundrect_ext(_x1 + 6, _y1 + 8, _x2 + 6, _y2 + 8, _radius, _radius, false);
} else {
    if (_click) {
        _body_color = merge_colour(_body_color, c_black, 0.1);
    } else if (_hover) {
		_body_color = make_colour_rgb(197, 183, 241);
    }
}

draw_set_color(_body_color);
draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_whyte_bold_13);
if (_is_disabled) {
	draw_set_colour(c_ltgray);
}
else {
	draw_set_color(c_black);
}

draw_text(247, 495, "Reset");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
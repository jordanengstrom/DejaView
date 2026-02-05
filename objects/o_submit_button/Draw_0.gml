var _center_x = 128;
var _center_y = 495;
width = 100;
height = 50;

x1 = _center_x - (width / 2);
y1 = _center_y - (height / 2);
x2 = _center_x + (width / 2);
y2 = _center_y + (height / 2);

radius = 24;
text = "Submit";

var _is_disabled = true;
if (variable_global_exists("user_selection")) {
    _is_disabled = (array_length(global.user_selection) < 5);
}

var _hover = point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2);
var _click = _hover && mouse_check_button(mb_left);

var _body_color = make_colour_rgb(211, 175, 0);
var _shadow_color = make_colour_rgb(79, 65, 0);

if (_is_disabled) {
    _body_color = c_gray; 
	_shadow_color = c_ltgray;
} else {
    if (_click) {
        _body_color = merge_colour(_body_color, c_black, 0.1);
    } else if (_hover) {
        _body_color = make_colour_rgb(255, 221, 57);
    }
}

draw_set_color(_shadow_color);
draw_roundrect_ext(x1 + 6, y1 + 8, x2 + 6, y2 + 8, radius, radius, false);

draw_set_color(_body_color);
draw_roundrect_ext(x1, y1, x2, y2, radius, radius, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_whyte_bold_13);
if (_is_disabled) {
	draw_set_colour(c_ltgray);
}
else {
	draw_set_color(c_black);
}

draw_text(x1 + (width/2), y1 + (height/2), text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
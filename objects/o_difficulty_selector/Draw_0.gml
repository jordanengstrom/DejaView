var _radius = 20;
var _start_x = (room_width - total_w) / 2;
var _start_y = 230; 

draw_set_font(fnt_verdana_bold_13);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(options); i++) {
    var _x1 = _start_x + (i * (button_width + padding));
    var _y1 = _start_y;
    var _x2 = _x1 + button_width;
    var _y2 = _y1 + button_height;
    var _center_x = _x1 + (button_width / 2);
    var _center_y = _y1 + (button_height / 2);
    
    var _is_selected = (global.difficulty_setting == options[i].value);
    
    if (_is_selected) {
        draw_set_color(options[i].color);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false);
        draw_set_color(options[i].color);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, true);
    } else {
		_col = make_colour_rgb(17, 27, 51);
        draw_set_color(_col);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false);
        draw_set_color(options[i].color);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, true);
    }
    
    draw_set_color(c_white);
    draw_text(_center_x, _center_y, options[i].label);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
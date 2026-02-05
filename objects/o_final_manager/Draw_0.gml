 var _margin = 20;
var _x = _margin;
var _y = _margin;
var _width = room_width - (_margin * 2);
var _height = room_height - (_margin * 2);
var _radius = 24;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _body_color = make_color_rgb(118, 152, 232);
draw_set_color(_body_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, false);


var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _is_win = (string_pos("PERFECT", global.msg) > 0);
if (_is_win) {
	draw_set_font(fnt_verdana_bold_26);
    _col = make_colour_rgb(255, 215, 0);
    draw_set_color(_col);
    draw_text_transformed(_center_x, _center_y - 80, "VICTORY!", 1, 1, 0);
    
	draw_set_font(fnt_verdana_bold_13);
    draw_set_color(c_white);
    draw_text(_center_x, _center_y - 20, "Sequence correct");
} 
else {
	draw_set_font(fnt_verdana_bold_26);
	_col = make_colour_rgb(255, 215, 0);
    draw_set_color(_col);
    draw_text_transformed(_center_x, _center_y - 80, "GAME OVER", 1, 1, 0);
    
	draw_set_font(fnt_verdana_bold_13);
    draw_set_color(c_white);
    draw_text(_center_x, _center_y - 30, global.msg);
}

draw_set_font(fnt_verdana_bold_13);
draw_set_color(c_white);
draw_text_transformed(_center_x, _center_y + 20, "Score: " + string(global.player_score), 1, 1, 0);

if (!is_undefined(global.my_rank_info)) {
    var _my_rank = global.my_rank_info.rank;
    var _best_score = global.my_rank_info.score;
    
    draw_set_color(c_ltgray);
	draw_set_font(fnt_verdana_bold_13);
    draw_text_transformed(_center_x, _center_y + 60, "Rank: " + string(_my_rank), 1, 1, 0);
    
    if (_best_score > global.player_score) {
		 draw_set_font(fnt_verdana_bold_13);
         draw_text_transformed(_center_x, _center_y + 80, "(High Score: " + string(_best_score) + ")", 1, 1, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
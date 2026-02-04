var _margin = 20;
var _w = room_width - (_margin * 2);
var _x = _margin;
var _y = y + 40;
var _h = 40 + (3 * 25) + 20; 

draw_sprite_stretched(s_card_frame, 0, _x, _y, _w, _h);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_color(c_navy);
draw_set_font(fnt_verdana_regular_14)
draw_text(_x + (_w / 2), _y + 15, "--- TODAY'S TOP 3 ---");

var _start_text_y = _y + 50;
var _line_height = 25;

if (loading_status == "Loaded") {
    if (array_length(top_scores) == 0) {
        draw_set_color(c_gray);
        draw_text(_x + (_w / 2), _start_text_y, "No scores yet!");
    }
    else {
        draw_set_color(c_black);
        for (var i = 0; i < array_length(top_scores); i++) {
            var _entry = top_scores[i];
            var _display_rank = i + 1;
            var _name = _entry.username;
            var _score = _entry.score;
            var _text = string(_display_rank) + ". " + _name + " - " + string(_score);
            draw_text(_x + (_w / 2), _start_text_y + (i * _line_height), _text);
        }
    }
} 
else {
    draw_set_color(c_gray);
    draw_text(_x + (_w / 2), _start_text_y, loading_status);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
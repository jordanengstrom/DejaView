var _width = 335;
var _height = 180;
var _x = 20;
var _y = 20;
var _radius = 24;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _shadow_color = make_colour_rgb(13, 49, 132);
draw_set_color(_shadow_color);
draw_roundrect_ext(_x + 6, _y + 8, _x + _width + 6, _y + _height + 8, _radius, _radius, false);

var _body_color = make_colour_rgb(127, 166, 255);
draw_set_color(_body_color);
draw_roundrect_ext(_x, _y, _x + _width, _y + _height, _radius, _radius, false);

var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_aovel_sans_rounded_18);
draw_set_colour(c_black);
draw_text_transformed(_center_x, _center_y - 55, "HOW TO PLAY", 1, 1, 0);

draw_set_font(fnt_whyte_bold_13);
var _instruction_text = "Reassemble the order of images after they are shown in rapid sequence. Select difficulty level, then press play.";
var _sep = 25;
var _w = 300;
draw_text_ext_transformed(_center_x, _center_y + 30, _instruction_text, _sep, _w, 1, 1, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


// DEBUG MODE
//var _width = 335; 
//var _height = 180;
//var _x = 20; 
//var _y = 20;

//draw_sprite_stretched(s_card_frame_light, 0, _x, _y, _width, _height);

//var _center_x = _x + (_width / 2);
//var _center_y = _y + (_height / 2);

//draw_set_font(global.main_font);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_set_color(c_maroon); 

//var _base = reddit_get_base_url();
//var _token = reddit_get_token();
//var _full_url = _base + "/api/leaderboard?limit=3"; 

//var _token_status = "MISSING";
//if (_token != "noone" && string_length(_token) > 5) {
//    _token_status = "OK (" + string_copy(_token, 1, 5) + "...)";
//} else {
//    _token_status = "ERROR: " + string(_token);
//}

//var _display_url = "";
//var _len = string_length(_full_url);
//var _chunk_size = 28; 
//for (var i = 1; i <= _len; i += _chunk_size) {
//    _display_url += string_copy(_full_url, i, _chunk_size) + "\n";
//}

//var _debug_text = "--- DEBUG MODE ---\n";
//_debug_text += "HTTP Code: " + string(global.debug_lb_status) + "\n"; // <--- NEW
//_debug_text += "Token: " + _token_status + "\n";
//_debug_text += "URL:\n" + _display_url;

//draw_text_ext(_center_x, _center_y, _debug_text, 18, 300);

//// Cleanup
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_color(c_white);
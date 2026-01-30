//var _x = 40;
//var _y = 20;
//var _width = 466;
//var _height = 180;

//draw_sprite_stretched(s_card_frame, 0, _x, _y, _width, _height);

//var _center_x = _x + (_width / 2);
//var _center_y = _y + (_height / 2);

//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_set_color(c_navy);

//var _instruction_text = "HOW TO PLAY\n\nSelect the correct order of a series of images after they are shown in rapid sequence.";

//draw_text_ext(_center_x, _center_y, _instruction_text, 30, 450);

//draw_set_halign(fa_left);
//draw_set_valign(fa_top);

// Background
var _width = 335; 
var _height = 180;

var _x = 20;
var _y = 20;

draw_sprite_stretched(s_card_frame, 0, _x, _y, _width, _height);


// Text
var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_navy);

var _instruction_text = "HOW TO PLAY\n\nReassemble the order of images after they are shown in rapid sequence. Select difficulty level, then press play.";
draw_text_ext(_center_x, _center_y, _instruction_text, 25, 300);

// Cleanup
draw_set_halign(fa_left);
draw_set_valign(fa_top);
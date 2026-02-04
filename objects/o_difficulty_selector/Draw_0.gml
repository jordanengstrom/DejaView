//var _w = 300;
//var _h = 80; // Slightly shorter height for better spacing
var _radius = 20;
//var _gap = 20; // Space between buttons

//// Adjust starting Y to fit below the instructions
//var _start_y = 240; 
//var _start_x = (room_width / 2) - (_w / 2);

//// Loop through 3 difficulty levels
//for (var i = 0; i < 3; i++) {
//    var _x = _start_x;
//    var _y = _start_y + (i * (_h + _gap));
    
//    // Check State
//    //var _is_selected = (global.difficulty == i);
//	var _is_selected = (global.difficulty_setting == options[i].value);
//    var _hover = position_meeting(mouse_x, mouse_y, id) && (mouse_y > _y && mouse_y < _y + _h);
    
//    // Define Colors based on state
//    var _col_bg = global.pal.bg_card;
//    var _col_border = c_ltgray;
//    var _text_col = global.pal.text_dark;
    
//    if (_is_selected) {
//        _col_bg = global.pal.success; // Green background when selected
//        _col_border = global.pal.success;
//        _text_col = c_white; // White text on green
//    } 
//    else if (_hover) {
//        _col_bg = merge_color(c_white, c_ltgray, 0.2); // Light grey hover
//        _col_border = global.pal.primary;
//    }

//    // --- 1. DRAW SHADOW ---
//    draw_set_color(c_black);
//    draw_set_alpha(0.2);
//    draw_roundrect_ext(_x + 4, _y + 6, _x + _w + 4, _y + _h + 6, _radius, _radius, false);
//    draw_set_alpha(1.0);

//    // --- 2. DRAW BUTTON BODY ---
//    draw_set_color(_col_bg);
//    draw_roundrect_ext(_x, _y, _x + _w, _y + _h, _radius, _radius, false);

//    // --- 3. DRAW BORDER ---
//    draw_set_color(_col_border);
//    draw_roundrect_ext(_x, _y, _x + _w, _y + _h, _radius, _radius, true);
    
//    // --- 4. DRAW TEXT ---
//    draw_set_halign(fa_center);
//    draw_set_valign(fa_middle);
//    draw_set_font(global.main_font);
//    draw_set_color(_text_col);
    
//    var _labels = ["EASY", "MEDIUM", "HARD"];
//    draw_text_transformed(_x + _w/2, _y + _h/2, _labels[i], 0.5, 0.5, 0);
//}

// Update the object's collision mask to cover the whole area (for mouse clicks)
// We do this logically in the Step event, but visually this draws the targets.

// Cleanup
//draw_set_color(c_white);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);

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
        //draw_rectangle(_x1, _y1, _x2, _y2, false);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false);  // body
        draw_set_color(options[i].color);
        //draw_rectangle(_x1, _y1, _x2, _y2, true);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, true);  // border
    } else {
		_col = make_colour_rgb(17, 27, 51);
        draw_set_color(_col);
        //draw_rectangle(_x1, _y1, _x2, _y2, false);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false);
        draw_set_color(options[i].color);
        //draw_rectangle(_x1, _y1, _x2, _y2, true);
		draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, true);
    }
    
    draw_set_color(c_white);
    draw_text(_center_x, _center_y, options[i].label);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
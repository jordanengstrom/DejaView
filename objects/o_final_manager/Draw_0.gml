 var _margin = 20;
var _x = _margin;
var _y = _margin;
var _width = room_width - (_margin * 2);
var _height = room_height - (_margin * 2);

draw_sprite_stretched(s_card_frame, 0, _x, _y, _width, _height);

// Setup Text Alignment
var _center_x = _x + (_width / 2);
var _center_y = _y + (_height / 2);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Conditional Logic
// We check if "PERFECT" exists in the message to detect a win
var _is_win = (string_pos("PERFECT", global.msg) > 0);

if (_is_win) {
    // --- WIN STATE ---
    draw_set_color(c_lime); 
    draw_text_transformed(_center_x, _center_y - 80, "VICTORY!", 2.5, 2.5, 0);
    
    draw_set_color(c_white);
    draw_text(_center_x, _center_y - 30, "Sequence Correct.");
} 
else {
    // --- LOSS / PARTIAL STATE ---
    draw_set_color(c_red); 
    draw_text_transformed(_center_x, _center_y - 80, "GAME OVER", 2.5, 2.5, 0);
    
    draw_set_color(c_white);
    // Draw the dynamic "INCOMPLETE. 3/5 CORRECT." message
    draw_text(_center_x, _center_y - 30, global.msg);
}

// --- DRAW SCORE (Common to both) ---
// We draw this below the result text
draw_set_color(make_color_rgb(234, 194, 130)); // Gold Color
draw_text_transformed(_center_x, _center_y + 30, "SCORE: " + string(global.player_score), 1.5, 1.5, 0);


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white); 
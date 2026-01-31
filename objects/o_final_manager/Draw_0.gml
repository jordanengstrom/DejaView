// 1. Draw the Background Frame
var _margin = 20;
var _x = _margin;
var _y = _margin;
var _width = room_width - (_margin * 2);  // 375 - 40 = 335
var _height = room_height - (_margin * 2); // 584 - 40 = 544

draw_sprite_stretched(s_card_frame, 0, _x, _y, _width, _height);

// 2. Setup Text Alignment (Center of the card)
var _center_x = _x + (_width / 2); // 270
var _center_y = _y + (_height / 2); // 270

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 3. Conditional Text Logic
if (global.msg == "CORRECT! YOU WIN!") {
    
    // --- WIN STATE ---
    draw_set_color(c_lime); // Bright Green
    
    // Draw "VICTORY" big
    draw_text_transformed(_center_x, _center_y - 40, "VICTORY!", 3, 3, 0);
    
    // Draw the specific message smaller below it
    draw_set_color(c_white);
    draw_text(_center_x, _center_y + 40, "Sequence Correct.");
	draw_text(_center_x, _center_y + 60, "Would you like to play again?");
    
} 
else if (global.msg == "WRONG ORDER. TRY AGAIN.") {
    
    // --- LOSS STATE ---
    draw_set_color(c_red); // Red
    
    // Draw "DEFEAT" big
    draw_text_transformed(_center_x, _center_y - 40, "GAME OVER", 3, 3, 0);
    
    // Draw the specific message smaller below it
    draw_set_color(c_white);
    draw_text(_center_x, _center_y + 40, "Sequence Incorrect.");
	draw_text(_center_x, _center_y + 60, "Would you like to try again?");
}

// 4. Cleanup (Always reset alignment!)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
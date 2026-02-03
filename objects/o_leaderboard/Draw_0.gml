// --- 1. SETUP LAYOUT ---
var _margin = 20;
var _w = room_width - (_margin * 2);
var _x = _margin;
var _y = y + 40; // Uses the object's Y position in the room

// Calculate Height dynamically
// Header (40px) + 3 Lines (25px each) + Padding (20px)
var _h = 40 + (3 * 25) + 20; 

// --- 2. DRAW BACKGROUND ---
// This creates the "Directions Box" look
draw_sprite_stretched(s_card_frame, 0, _x, _y, _w, _h);

// --- 3. DRAW CONTENT ---
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Draw Header
draw_set_color(c_navy); 
// Position header slightly down from the top edge of the box
draw_text(_x + (_w / 2), _y + 15, "--- TODAY'S TOP 3 ---");

// Set up for list items
var _start_text_y = _y + 50; // Start below the header
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
            
            // Calc Rank (1, 2, 3...)
            var _display_rank = i + 1; 
            
            var _name = _entry.username;
            var _score = _entry.score;
            
            // Truncate name if it's too long to fit
            //if (string_length(_name) > 15) {
            //    _name = string_copy(_name, 1, 12) + "...";
            //}
            
            var _text = string(_display_rank) + ". " + _name + " - " + string(_score);
            
            draw_text(_x + (_w / 2), _start_text_y + (i * _line_height), _text);
        }
    }
} 
else {
    // Draw Loading/Error Text
    draw_set_color(c_gray);
    draw_text(_x + (_w / 2), _start_text_y, loading_status);
}

// Cleanup
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
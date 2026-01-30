// --- LAYOUT CONFIGURATION (Must match Draw Event) ---
var _card_w = 400; 
var _card_h = 80;  
var _gap = 10;     
var _start_x = (room_width - _card_w) / 2; 
var _start_y = _gap; 

// Check for Left Mouse Click
if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;

    // ------------------------------------------------
    // 1. CHECK CARD CLICKS
    // ------------------------------------------------
    // Only allow selecting if we haven't picked 5 cards yet
    if (array_length(global.user_selection) < 5) {
        
        for (var i = 0; i < array_length(global.display_order); i++) {
            // Calculate Hitbox for this specific card
            var _card_x1 = _start_x;
            var _card_y1 = _start_y + (i * (_card_h + _gap));
            var _card_x2 = _card_x1 + _card_w;
            var _card_y2 = _card_y1 + _card_h;
            
            // Check if mouse is inside this card
            if (point_in_rectangle(_mx, _my, _card_x1, _card_y1, _card_x2, _card_y2)) {
                
                var _clicked_val = global.display_order[i];
                
                // Prevent duplicate selection (Check if we already picked this ID)
                var _already_picked = false;
                for (var k = 0; k < array_length(global.user_selection); k++) {
                    if (global.user_selection[k] == _clicked_val) {
                        _already_picked = true;
                        break;
                    }
                }
                
                // If valid and not duplicate, add to selection
                if (!_already_picked) {
                    array_push(global.user_selection, _clicked_val);
                }
            }
        }
    }

    // ------------------------------------------------
    // 2. CHECK SUBMIT BUTTON CLICK
    // ------------------------------------------------
    // Based on your Draw code, the button is drawn at the index AFTER the last card.
    // Logic: var _y = _start_y + (i * (_card_h + _gap)); where i is the array length.
    
    var _btn_index = array_length(global.display_order);
    var _btn_size = _card_h - 20; // As defined in your draw event (_icon_size)
    
    var _btn_x1 = _start_x + 10; // Left aligned + 10px padding
    var _btn_y1 = _start_y + (_btn_index * (_card_h + _gap)) + 10; // +10px padding
    var _btn_x2 = _btn_x1 + _btn_size;
    var _btn_y2 = _btn_y1 + _btn_size;

    if (point_in_rectangle(_mx, _my, _btn_x1, _btn_y1, _btn_x2, _btn_y2)) {
        
        // A. Validate Selection Length
        if (array_length(global.user_selection) < 5) {
            global.msg = "Select all 5 cards first!";
        } 
        else {
            // B. Validate Order
            var _won = true;
            for (var i = 0; i < 5; i++) {
                // Compare User's selection vs The Global Solution
                if (global.user_selection[i] != global.game_solution[i]) {
                    _won = false;
                    break;
                }
            }
            
            // C. Result
            if (_won) {
                global.msg = "CORRECT! YOU WIN!";
				room_goto(r_final);
            } else {
                global.msg = "WRONG ORDER. TRY AGAIN.";
                global.user_selection = [];
				room_goto(r_final);
            }
        }
    }
}
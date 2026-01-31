var _margin = 20;
var _card_w = room_width - (_margin * 2);
var _card_h = 75;  
var _gap = 10;     
var _start_x = _margin; 
var _start_y = _margin; 

// Check for Left Mouse Click
if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;

    // ------------------------------------------------
    // 1. CHECK CARD CLICKS
    // ------------------------------------------------
    if (array_length(global.user_selection) < 5) {
        
        for (var i = 0; i < array_length(global.display_order); i++) {
            // Hitbox
            var _card_x1 = _start_x;
            var _card_y1 = _start_y + (i * (_card_h + _gap));
            var _card_x2 = _card_x1 + _card_w;
            var _card_y2 = _card_y1 + _card_h;
            
            if (point_in_rectangle(_mx, _my, _card_x1, _card_y1, _card_x2, _card_y2)) {
                
                var _clicked_val = global.display_order[i];
                
                // Check if already picked
                var _already_picked = false;
                for (var k = 0; k < array_length(global.user_selection); k++) {
                    if (global.user_selection[k] == _clicked_val) {
                        _already_picked = true;
                        break;
                    }
                }
                
                // Add to selection
                if (!_already_picked) {
                    array_push(global.user_selection, _clicked_val);
                    // Optional: Play Sound
                }
            }
        }
    }
}
// --- LAYOUT CONFIGURATION ---
var _card_w = 400; // Width of the line item
var _card_h = 80;  // Height of the line item
var _gap = 10;     // Space between rows

// Center the list horizontally in the room
var _start_x = (room_width - _card_w) / 2; 
var _start_y = _gap; 

// --- DRAW THE CARDS ---
for (var i = 0; i < array_length(global.display_order); i++) {
    
    // 1. Calculate Position (Vertical Layout)
    var _x = _start_x; 
    var _y = _start_y + (i * (_card_h + _gap)); // Moves down for every 'i'

    // 2. Get Sprite Asset (Using your specific naming logic)
    _obj = global.display_order[i]; 
	_spr = object_get_sprite(_obj);
	sprite_index = _spr
	var _info = sprite_get_info(_spr);

    // 3. Draw the "Line Item" Background
	col = #8393CA;
    draw_set_color(col); // Background color
    draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, false);
    
    draw_set_color(c_white);  // Border color
    draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, true);

    // 4. Draw the Sprite (Far Left, inside the card)
    if (sprite_exists(_spr)) {
        // Draw 10px padding from the left edge
        var _icon_size = _card_h - 20; // Slightly smaller than card height
        draw_sprite_stretched(sprite_index, 0, _x + 10, _y + 10, _icon_size, _icon_size);
    }

    // 5. Visual Feedback: Check if selected and Draw Number (Far Right)
    var _selection_index = -1;
    
    // Scan the global.user_selection array to see if this card ID (_val) has been clicked
	var _card_id = global.display_order[i];
    for (var j = 0; j < array_length(global.user_selection); j++) {
        if (global.user_selection[j] == _card_id) {
            _selection_index = j + 1; // 1-based index (1st, 2nd, 3rd...)
            break;
        }
    }

    // If selected, draw the number on the far right
    if (_selection_index != -1) {
		draw_set_color(c_navy);
        draw_set_halign(fa_right); // Align text to the right
        draw_set_valign(fa_middle); // Align text to vertical center
        
        // Position: X = Right edge of card minus padding, Y = Center of card
        draw_text_transformed(_x + _card_w - 30, _y + (_card_h / 2), string(_selection_index), 2, 2, 0);
    }
}

// --- CLEANUP ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
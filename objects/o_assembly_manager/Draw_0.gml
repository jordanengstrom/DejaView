var _margin = 20;
var _card_w = room_width - (_margin * 2); // Dynamic Width (335px on mobile)
var _card_h = 75;  // Slightly reduced from 80 to ensure vertical fit
var _gap = 10;     // Space between rows

var _start_x = _margin; 
var _start_y = _margin; 

// --- DRAW THE CARDS ---
for (var i = 0; i < array_length(global.display_order); i++) {
    
    // 1. Calculate Position
    var _x = _start_x; 
    var _y = _start_y + (i * (_card_h + _gap)); 

    // 2. Get Data
    var _obj = global.display_order[i]; 
    var _spr = object_get_sprite(_obj);
    
    // 3. Draw Card Background
    var _col = make_color_rgb(131, 147, 202); // #8393CA
    
    // Check if this specific card is selected to change highlight
    var _is_selected = false;
    for (var k = 0; k < array_length(global.user_selection); k++) {
        if (global.user_selection[k] == _obj) { _is_selected = true; break; }
    }
    
    if (_is_selected) {
		var _highlight_col = make_color_rgb(193, 201, 228);
        draw_set_color(_highlight_col); // Highlight selected background
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, false);
        draw_set_color(_col);    // Colored border
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, true);
    } else {
        draw_set_color(_col);    // Normal background
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, false);
        draw_set_color(c_white); // White border
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, true);
    }

    // 4. Draw the Sprite (Far Left)
    if (sprite_exists(_spr)) {
        var _icon_size = _card_h - 10; 
        // Centered vertically in the card, left aligned with padding
        draw_sprite_stretched(_spr, 0, _x + 5, _y + 5, _icon_size, _icon_size);
    }

    // 5. Draw Selection Number (Far Right)
    var _selection_index = -1;
    for (var j = 0; j < array_length(global.user_selection); j++) {
        if (global.user_selection[j] == _obj) {
            _selection_index = j + 1; 
            break;
        }
    }

    if (_selection_index != -1) {
        draw_set_color(c_navy);
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_text_transformed(_x + _card_w - 20, _y + (_card_h / 2), string(_selection_index), 2, 2, 0);
    }
}

// Cleanup
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;

    for (var i = 0; i < array_length(global.display_order); i++) {
        var _x1 = start_x;
        var _y1 = start_y + (i * (card_h + gap));
        var _x2 = _x1 + card_w;
        var _y2 = _y1 + card_h;
        
        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            
            var _clicked_val = global.display_order[i];
            
            var _index_in_selection = -1;
            for (var k = 0; k < array_length(global.user_selection); k++) {
                if (global.user_selection[k] == _clicked_val) {
                    _index_in_selection = k;
                    break;
                }
            }
			
            if (_index_in_selection == -1) {
                if (array_length(global.user_selection) < 5) {
                    array_push(global.user_selection, _clicked_val);
                }
            }
            else {
                var _last_pos = array_length(global.user_selection) - 1;
                if (_index_in_selection == _last_pos) {
                    array_pop(global.user_selection);
                }
            }
        }
    }
}
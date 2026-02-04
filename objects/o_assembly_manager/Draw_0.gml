for (var i = 0; i < array_length(global.display_order); i++) {
    
    var _x = start_x;
    var _y = start_y + (i * (card_h + gap));
	var _radius = 24;
    
    var _obj = global.display_order[i];
    var _spr = object_get_sprite(_obj);
    
    var _selection_index = -1;
    for (var k = 0; k < array_length(global.user_selection); k++) {
        if (global.user_selection[k] == _obj) {
            _selection_index = k + 1; // Convert 0-based to 1-based (1, 2, 3...)
            break;
        }
    }
    
    var _is_selected = (_selection_index != -1);
    
    var _bg_col = make_color_rgb(102, 132, 204);
	draw_set_alpha(255);
    var _border_col = make_colour_rgb(17, 27, 51);
    
    if (_is_selected) {
        _bg_col = make_color_rgb(118, 152, 232);
    }

    draw_set_color(_bg_col);
	draw_roundrect_ext(_x, _y, _x + card_w, _y + card_h, _radius, _radius, false);
	
    draw_set_color(_border_col);
    draw_rectangle(_x, _y, _x + card_w, _y + card_h, true);
    
    if (sprite_exists(_spr)) {
        var _icon_size = card_h - 10;
        draw_sprite_stretched(_spr, 0, _x + 5, _y + 5, _icon_size, _icon_size);
    }
    
    if (_is_selected) {
        
        var _is_removable = (_selection_index == array_length(global.user_selection));
        
        if (_is_removable) {
            draw_set_color(c_navy);
        } else {
            draw_set_color(c_navy);
        }
        
		draw_set_font(fnt_whyte_bold_32);
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_text_transformed(_x + card_w - 20, _y + (card_h / 2), string(_selection_index), 1, 1, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
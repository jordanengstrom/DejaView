var is_hovering = position_meeting(mouse_x, mouse_y, id);
if (array_length(global.user_selection) < 5) {
    sprite_index = s_submit_button_inactive;
}
if (array_length(global.user_selection) == 5) {
	if (is_hovering) {
	    sprite_index = s_submit_button_active;
	} else {
	    sprite_index = s_submit_button;
	}
}
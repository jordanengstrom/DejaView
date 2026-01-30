var is_hovering = position_meeting(mouse_x, mouse_y, id);

if (is_hovering) {
    sprite_index = s_retry_active;
} else {
    sprite_index = s_retry;
}
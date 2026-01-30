var is_hovering = position_meeting(mouse_x, mouse_y, id);
var is_clicked = mouse_check_button(mb_left);

if (is_hovering) {
    if (is_clicked) {
        // State: Pressed/Tapped
        sprite_index = s_play_button_active;
    } else {
        // State: Hovering
        sprite_index = s_play_button_active;
    }
    
    if (mouse_check_button_released(mb_left)) {
        room_goto(r_main);
    }
} else {
    // State: Normal/Idle
    sprite_index = s_play_button;
}
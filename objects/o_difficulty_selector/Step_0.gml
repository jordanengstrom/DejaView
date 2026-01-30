var _mx = mouse_x;
var _my = mouse_y;

for (var i = 0; i < array_length(options); i++) {
    
    // Calculate this button's coordinates
    var _x1 = start_x + (i * (button_width + padding));
    var _y1 = start_y;
    var _x2 = _x1 + button_width;
    var _y2 = _y1 + button_height;
    
    // Check collision
    if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
        // If clicked, update the global setting
        if (mouse_check_button_pressed(mb_left)) {
            global.difficulty_setting = options[i].value;
            // Optional: Play sound
            // audio_play_sound(snd_click, 1, false);
        }
    }
}
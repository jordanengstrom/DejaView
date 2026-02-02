var _start_x = (room_width - total_w) / 2;
var _start_y = 230; 

var _mx = mouse_x;
var _my = mouse_y;

for (var i = 0; i < array_length(options); i++) {
    var _x1 = _start_x + (i * (button_width + padding));
    var _y1 = _start_y;
    var _x2 = _x1 + button_width;
    var _y2 = _y1 + button_height;
    
    if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
        if (mouse_check_button_pressed(mb_left)) {
            global.difficulty_setting = options[i].value;
        }
    }
}
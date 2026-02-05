var _x1 = 197;
var _y1 = 470;
var _x2 = 297;
var _y2 = 520;

var _hover = point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2);

if (_hover && mouse_check_button_released(mb_left)) {
	if (instance_exists(o_assembly_manager)) {
	    global.user_selection = [];
	    global.msg = "";
	}
}
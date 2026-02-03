var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_w = camera_get_view_width(_cam);

x = _cam_x + (_cam_w / 2);
y = _cam_y + 340;

image_xscale = 0.7;

draw_self();
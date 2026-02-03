username = "";
level = 0;
points = 0;
prev_points = 0;

global.debug_lb_status = "Waiting...";
global.debug_lb_response = "";

api_load_state(function(_status, _ok, _result, _payload) {
	try {
		var _state = json_parse(_result);
		username = _state.username;
		level = _state.level;
		points = _state.data.points;
	}
	catch (_ex) {
		api_save_state(0, { points }, undefined);
	}
});
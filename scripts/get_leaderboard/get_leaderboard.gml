function get_leaderboard(_limit) {
	api_get_leaderboard(_limit, function(_status, _ok, _result, _payload) {
	if (_ok) {
	    try {
	        var _json = json_parse(_result);
			if (variable_struct_exists(_json, "top")) {
				return _json.top;
			}
	        if (variable_struct_exists(_json, "me") && is_struct(_json.me)) {
	            global.my_rank_info = _json.me;
	        }
	        global.leaderboard_status = "Loaded";
	    } catch (_ex) {
	        global.leaderboard_status = "Error parsing data";
	    }
	} else {
	    global.leaderboard_status = "Connection Failed";
	}
	});
}
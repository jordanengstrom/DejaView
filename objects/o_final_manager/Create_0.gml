global.leaderboard_data = [];
global.leaderboard_status = "Loading...";
global.my_rank_info = undefined; 

if (global.player_score > 0) {
	api_submit_score(global.player_score, function(_data) {
        //get_leaderboard(3);
	api_get_leaderboard(3, function(_status, _ok, _result, _payload) {
		if (_ok) {
			global.leaderboard_status = "Loaded";
		    try {
		        var _json = json_parse(_result);
				if (variable_struct_exists(_json, "top")) {
					return _json.top;
				}
		        if (variable_struct_exists(_json, "me") && is_struct(_json.me)) {
		            global.my_rank_info = _json.me;
		        }
		    } catch (_ex) {
		        global.leaderboard_status = "Error parsing data";
		    }
		} else {
		    global.leaderboard_status = "Connection Failed";
		}
	})
    });
}
else {
	//get_leaderboard(3);
	api_get_leaderboard(3, function(_status, _ok, _result, _payload) {
		if (_ok) {
			global.leaderboard_status = "Loaded";
		    try {
		        var _json = json_parse(_result);
				if (variable_struct_exists(_json, "top")) {
					return _json.top;
				}
		        if (variable_struct_exists(_json, "me") && is_struct(_json.me)) {
		            global.my_rank_info = _json.me;
		        }
		    } catch (_ex) {
		        global.leaderboard_status = "Error parsing data";
		    }
		} else {
		    global.leaderboard_status = "Connection Failed";
		}
	})
}
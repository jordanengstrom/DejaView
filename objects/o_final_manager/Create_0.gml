global.leaderboard_data = [];
global.leaderboard_status = "Loading...";
global.my_rank_info = undefined; 

api_get_leaderboard(10, function(_status, _ok, _result, _payload) {
    if (_ok) {
        try {
            var _json = json_parse(_result);
            
            if (variable_struct_exists(_json, "top")) {
                global.leaderboard_data = _json.top;
                array_sort(global.leaderboard_data, function(_a, _b) {
                    return _b.score - _a.score;
                });
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
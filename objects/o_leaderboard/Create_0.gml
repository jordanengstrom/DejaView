loading_status = "\nLoading top scores...";
top_scores = [];
my_rank_data = undefined;

api_get_leaderboard(3, function(_status, _ok, _result, _payload) {
	global.debug_lb_status = string(_status);
    
    if (string_length(_result) > 20) {
        global.debug_lb_response = string_copy(_result, 1, 20) + "...";
    } else {
        global.debug_lb_response = _result;
    }
    if (_ok) {
        try {
            var _json = json_parse(_result);
            if (variable_struct_exists(_json, "top")) {
                top_scores = _json.top;
                array_sort(top_scores, function(_a, _b) {
                    return _b.score - _a.score;
                });
                if (variable_struct_exists(_json, "me")) {
                    my_rank_data = _json.me;
                }
                loading_status = "Loaded";
            } 
            else {
                top_scores = [];
                loading_status = "\n...so far, so empty...";
            }
            
        } catch (_ex) {
            loading_status = "Error parsing data.";
        }
    } else {
        loading_status = "Connection Failed.";
    }
});
// Initialize State
loading_status = "Loading Top Scores...";
top_scores = [];
my_rank_data = undefined; // We can store the 'me' data too if we want it later

// Request Top 3
api_get_leaderboard(3, function(_status, _ok, _result, _payload) {
	global.debug_lb_status = string(_status);
    
    // Optional: Capture a snippet of the result to see if it's HTML
    if (string_length(_result) > 20) {
        global.debug_lb_response = string_copy(_result, 1, 20) + "...";
    } else {
        global.debug_lb_response = _result;
    }
    if (_ok) {
        try {
            var _json = json_parse(_result);
             
            // --- TARGET THE "top" PROPERTY ---
            if (variable_struct_exists(_json, "top")) {
                top_scores = _json.top;
                
				// Sorts scores highest to lowest:
                array_sort(top_scores, function(_a, _b) {
                    return _b.score - _a.score;
                });
				
                // Optional: Capture "me" data if you want to display the player's personal rank
                if (variable_struct_exists(_json, "me")) {
                    my_rank_data = _json.me;
                }
                
                loading_status = "Loaded";
            } 
            else {
                // If the "top" key is missing, something is wrong or empty
                top_scores = [];
                loading_status = "No data found";
            }
            
        } catch (_ex) {
            loading_status = "Error parsing data.";
            show_debug_message(_ex.message);
        }
    } else {
        loading_status = "Connection Failed.";
    }
});
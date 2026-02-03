// Initialize Leaderboard Variables
global.leaderboard_data = [];
global.leaderboard_status = "Loading...";

// Store player's personal rank
global.my_rank_info = undefined; 

// REQUEST LEADERBOARD
//api_get_leaderboard(10, function(_status, _ok, _result, _payload) {
//    if (_ok) {
//        try {
//            var _json = json_parse(_result);
            
//            // 1. Get Top Scores
//            if (variable_struct_exists(_json, "top")) {
//                global.leaderboard_data = _json.top;
//            }
            
//            // 2. Get "Me" Data (Your Rank)
//            if (variable_struct_exists(_json, "me")) {
//                global.my_rank_info = _json.me;
//            }

//            global.leaderboard_status = "Loaded";
//        } catch (_ex) {
//            global.leaderboard_status = "Error";
//        }
//    } else {
//        global.leaderboard_status = "Connection Failed";
//    }
//});

api_get_leaderboard(10, function(_status, _ok, _result, _payload) {
    if (_ok) {
        try {
            var _json = json_parse(_result);
            
            // 1. Parse "top" (The List)
            if (variable_struct_exists(_json, "top")) {
                global.leaderboard_data = _json.top;
                
                // IMPORTANT: The server uses zRange (Ascending), so we MUST 
                // sort Descending (Highest Score First) in GameMaker.
                array_sort(global.leaderboard_data, function(_a, _b) {
                    // Returns positive if b > a, placing higher scores first
                    return _b.score - _a.score;
                });
            }
            
            // 2. Parse "me" (My Rank)
            // Only overwrite if the server sends valid data
            if (variable_struct_exists(_json, "me") && is_struct(_json.me)) {
                global.my_rank_info = _json.me;
            }

            global.leaderboard_status = "Loaded";
        } catch (_ex) {
            global.leaderboard_status = "Error parsing data";
            show_debug_message(_ex.message);
        }
    } else {
        global.leaderboard_status = "Connection Failed";
    }
});
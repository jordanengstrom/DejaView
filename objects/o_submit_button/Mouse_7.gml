if (array_length(global.user_selection) < 5) {
    global.msg = "Select all 5 cards first!";
} 
else {
    var _matches = 0;
    for (var i = 0; i < 5; i++) {
        if (global.user_selection[i] == global.game_solution[i]) {
            _matches += 1;
        }
    }
    var _raw_score = _matches * global.score_rules.points_per_match;
    var _is_perfect = (_matches == 5);
    
    if (_is_perfect) {
        _raw_score += global.score_rules.completion_bonus;
        
        var _time_elapsed_ms = current_time - global.start_time;
        var _time_elapsed_sec = _time_elapsed_ms / 1000;
        
        var _time_bonus = max(0, global.score_rules.max_time_bonus - (_time_elapsed_sec * global.score_rules.points_drain_per_sec));
        
        _raw_score += _time_bonus;
        
        global.msg = "PERFECT SEQUENCE!";
    } else {
        global.msg = "INCOMPLETE. " + string(_matches) + "/5 CORRECT.";
    }
    
    var _mult = global.difficulty_mult[$ global.difficulty_setting];
    
    global.player_score = floor(_raw_score * _mult);

	if (instance_exists(o_game)) {
		o_game.points += global.player_score;
    
		api_save_state(o_game.level, { points: o_game.points }, function(_status, _ok, _result) {
		});
	}

	api_submit_score(global.player_score, function(_status, _ok, _result) {
		if (_ok) {
		    try {
		        var _resp = json_parse(_result);
		        if (variable_struct_exists(_resp, "success") && _resp.success) {
		            global.my_rank_info = {
		                rank: _resp.rank,
		                score: _resp.score,
		                username: global.player_username
		            };
		            if (_resp.isNewBest) {
		                global.msg = "NEW HIGH SCORE!"; 
		            }
		        }
		    } catch (_ex) {
		    }
		}
	});
    room_goto(r_final);
}
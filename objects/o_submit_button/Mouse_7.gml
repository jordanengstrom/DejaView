//if (array_length(global.user_selection) < 5) {
//    global.msg = "Select all 5 cards first!";
//} 
//else {
//	// --- 1. CALCULATE ACCURACY (PARTIAL CREDIT) ---
//    var _matches = 0;
//    for (var i = 0; i < 5; i++) {
//        if (global.user_selection[i] == global.game_solution[i]) {
//            _matches += 1;
//        }
//    }
    
//    // --- 2. CALCULATE RAW SCORE ---
//    // Base points for every correct card
//    var _raw_score = _matches * global.score_rules.points_per_match;
    
//    // Check for perfection
//    var _is_perfect = (_matches == 5);
    
//    if (_is_perfect) {
//        // A. Add Completion Bonus
//        _raw_score += global.score_rules.completion_bonus;
        
//        // B. Add Time Bonus (Only for winners)
//        var _time_elapsed_ms = current_time - global.start_time;
//        var _time_elapsed_sec = _time_elapsed_ms / 1000;
        
//        // Calculate drain: Max Bonus - (Seconds * Drain Rate)
//        // Use max(0, ...) so it never becomes negative
//        var _time_bonus = max(0, global.score_rules.max_time_bonus - (_time_elapsed_sec * global.score_rules.points_drain_per_sec));
        
//        _raw_score += _time_bonus;
        
//        global.msg = "PERFECT SEQUENCE!";
//    } else {
//        global.msg = "INCOMPLETE. " + string(_matches) + "/5 CORRECT.";
//    }
    
//    // --- 3. APPLY DIFFICULTY MULTIPLIER ---
//    // Look up the multiplier (0.5, 1.0, or 2.0) based on the setting string
//    var _mult = global.difficulty_mult[$ global.difficulty_setting];
    
//    // Final integer score
//    global.player_score = floor(_raw_score * _mult);

//	room_goto(r_final);
//}

if (array_length(global.user_selection) < 5) {
    global.msg = "Select all 5 cards first!";
} 
else {
    // --- 1. CALCULATE ACCURACY (PARTIAL CREDIT) ---
    var _matches = 0;
    for (var i = 0; i < 5; i++) {
        if (global.user_selection[i] == global.game_solution[i]) {
            _matches += 1;
        }
    }
    
    // --- 2. CALCULATE RAW SCORE ---
    // Base points for every correct card
    var _raw_score = _matches * global.score_rules.points_per_match;
    
    // Check for perfection
    var _is_perfect = (_matches == 5);
    
    if (_is_perfect) {
        // A. Add Completion Bonus
        _raw_score += global.score_rules.completion_bonus;
        
        // B. Add Time Bonus (Only for winners)
        var _time_elapsed_ms = current_time - global.start_time;
        var _time_elapsed_sec = _time_elapsed_ms / 1000;
        
        // Calculate drain: Max Bonus - (Seconds * Drain Rate)
        // Use max(0, ...) so it never becomes negative
        var _time_bonus = max(0, global.score_rules.max_time_bonus - (_time_elapsed_sec * global.score_rules.points_drain_per_sec));
        
        _raw_score += _time_bonus;
        
        global.msg = "PERFECT SEQUENCE!";
    } else {
        global.msg = "INCOMPLETE. " + string(_matches) + "/5 CORRECT.";
    }
    
    // --- 3. APPLY DIFFICULTY MULTIPLIER ---
    // Look up the multiplier (0.5, 1.0, or 2.0) based on the setting string
    var _mult = global.difficulty_mult[$ global.difficulty_setting];
    
    // Final integer score
    global.player_score = floor(_raw_score * _mult);

    // --- 4. INTEGRATE REDDIT API CALLS ---
    
    // A. Update Persistent Game Object & Save State
    if (instance_exists(o_game)) {
        // Add this specific run's score to the lifetime total
        o_game.points += global.player_score;
        
        // Save the updated total to the Reddit cloud
        api_save_state(o_game.level, { points: o_game.points }, function(_status, _ok, _result) {
            if (_ok) show_debug_message("State saved successfully.");
        });
    }
    
    // B. Submit Score to Leaderboard
    api_submit_score(global.player_score, function(_status, _ok, _result) {
        if (_ok) show_debug_message("Score submitted to leaderboard.");
    });

    // --- 5. TRANSITION ---
    room_goto(r_final);
}
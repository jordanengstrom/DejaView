if (array_length(global.user_selection) < 5) {
    global.msg = "Select all 5 cards first!";
} 
else {
    var _won = true;
    for (var i = 0; i < 5; i++) {
        // Compare user's selection to the global.game_solution
        if (global.user_selection[i] != global.game_solution[i]) {
            _won = false;
            break;
        }
    }

    if (_won) {
        global.msg = "CORRECT! YOU WIN!";
		global.user_selection = [];
		room_goto(r_final);
    }
	else {
        global.msg = "WRONG ORDER. TRY AGAIN.";
        global.user_selection = [];
		room_goto(r_final);
    }
}
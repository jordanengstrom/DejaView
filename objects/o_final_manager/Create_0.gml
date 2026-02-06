global.leaderboard_data = [];
global.leaderboard_status = "Loading...";
global.my_rank_info = undefined; 

if (global.player_score > 0) {
	api_submit_score(global.player_score, function(_data) {
        get_leaderboard(3);
    });
}
else {
	get_leaderboard(3);
}
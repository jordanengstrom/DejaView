username = "";
level = 0;
points = 0;
prev_points = 0;

global.debug_lb_status = "Waiting...";
global.debug_lb_response = "";
global.main_font = fnt_aovel_sans_rounded_30;
draw_set_font(global.main_font);

global.pal = {
    // Backgrounds
    bg_dark:      $2A170F, // Web: #0f172a (Deep Slate) - Main BG
    bg_card:      $FFFFFF, // Web: #ffffff (White) - Cards/Modals
    
    // Text
    text_dark:    $1B1A1A, // Web: #1a1a1b (Nearly Black) - Text on White
    text_light:   $F0F0F0, // Off-white - Text on Dark
    text_dim:     $948C7D, // Web: #7d8c94 (Slate Grey) - Secondary info
    
    // Actions / Accents
    primary:      $D37900, // Web: #0079D3 (Reddit Blue) - Buttons/Highlights
    accent:       $0045FF, // Web: #FF4500 (Reddit Orange) - Alerts/Scores
    success:      $50C878, // Emerald Green - Correct matches
};

draw_set_color(global.pal.text_dark);

api_load_state(function(_status, _ok, _result, _payload) {
	try {
		var _state = json_parse(_result);
		username = _state.username;
		level = _state.level;
		points = _state.data.points;
	}
	catch (_ex) {
		api_save_state(0, { points }, undefined);
	}
});

draw_set_circle_precision(64);
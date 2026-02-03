global.user_selection = [];
randomize();
global.display_order = array_shuffle(global.game_solution);

show_debug_message("global.game_solution:");
show_debug_message(global.game_solution);

global.msg = "";

// --- LAYOUT CONFIGURATION ---
// We define these here so Step and Draw share the exact same numbers
margin = 20;
gap = 10;
card_h = 75;

// Calculate width based on room
card_w = room_width - (margin * 2); 
start_x = margin;
start_y = margin;

// --- START TIMER ---
// current_time is a built-in variable (milliseconds since game launch)
global.start_time = current_time;
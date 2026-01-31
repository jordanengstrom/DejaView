global.user_selection = [];
randomize();
global.display_order = array_shuffle(global.game_solution);

show_debug_message("global.game_solution:");
show_debug_message(global.game_solution);
show_debug_message("global.display_order:");
show_debug_message(global.display_order);

global.msg = "";
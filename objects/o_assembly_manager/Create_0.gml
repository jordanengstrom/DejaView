global.user_selection = [];
randomize();
global.display_order = array_shuffle(global.game_solution);

global.msg = "";

margin = 20;
gap = 10;
card_h = 75;

card_w = room_width - (margin * 2); 
start_x = margin;
start_y = margin;

global.start_time = current_time;
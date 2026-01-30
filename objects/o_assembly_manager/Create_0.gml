global.user_selection = [];
randomize();
global.display_order = array_shuffle(global.game_solution);

show_debug_message("global.game_solution:");
show_debug_message(global.game_solution);

show_debug_message("global.display_order:");
show_debug_message(global.display_order);

card_size = 80;
gap = 20;
start_x = (room_width - ((card_size * 5) + (gap * 4))) / 2;
y_pos = 200;

btn_rect = {x1: 200, y1: 400, x2: 340, y2: 450};
global.msg = "";
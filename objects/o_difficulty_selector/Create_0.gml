if (!variable_global_exists("difficulty_setting")) {
    global.difficulty_setting = "med";
}

global.score_rules = {
    points_per_match: 200,
    completion_bonus: 500,
    max_time_bonus:   1000,
    points_drain_per_sec: 10
};

global.difficulty_mult = {
    easy: 0.5,
    med: 1.0,
    hard:   2.0
};

global.player_score = 0;
global.start_time = 0;
global.difficulty_setting = "med";

button_width = 90;
button_height = 50;
padding = 20;

options = [
    { 
        label: "EASY",   
        value: "easy",   
        color: make_color_rgb(38, 102, 32)
    },
    { 
        label: "MED", 
        value: "med", 
        color: make_color_rgb(229, 192, 0)
    },
    { 
        label: "HARD",   
        value: "hard",   
        color: make_color_rgb(102, 5, 5)
    }
];

total_w = (array_length(options) * button_width) + ((array_length(options) - 1) * padding);
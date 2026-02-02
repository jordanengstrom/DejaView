// SCOREBOARD SETTINGS
if (!variable_global_exists("difficulty_setting")) {
    global.difficulty_setting = "medium";
}

global.score_rules = {
    points_per_match: 200,    // 5 cards * 200 = 1000 base
    completion_bonus: 500,    // Bonus for getting 5/5
    max_time_bonus:   1000,   // Max speed points possible
    points_drain_per_sec: 10  // Lose 10 points per second
};

global.difficulty_mult = {
    easy: 0.5,
    medium: 1.0,
    hard:   2.0
};

global.player_score = 0;
global.start_time = 0;


// UI SETTINGS
global.difficulty_setting = "medium";

button_width = 90;
button_height = 50;
padding = 20;

options = [
    { 
        label: "EASY",   
        value: "easy",   
        color: make_color_rgb(131, 202, 157) // #83CA9D (Sage Green)
    },
    { 
        label: "MEDIUM", 
        value: "medium", 
        color: make_color_rgb(234, 194, 130) // #EAC282 (Sand Gold)
    },
    { 
        label: "HARD",   
        value: "hard",   
        color: make_color_rgb(224, 123, 123) // #E07B7B (Muted Rose)
    }
];

total_w = (array_length(options) * button_width) + ((array_length(options) - 1) * padding);
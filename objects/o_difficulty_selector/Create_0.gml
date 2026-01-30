global.difficulty_setting = "medium";

// Configuration
button_width = 90;
button_height = 50;
padding = 20;

// Define the options struct
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


//// Calculate total width to help center them
//var _total_w = (array_length(options) * button_width) + ((array_length(options) - 1) * padding);
//start_x = (room_width - _total_w) / 2;
//start_y = 275; // Adjust vertical position as needed

// Calculate total width ONCE and save it to a variable 'total_w'
// (We removed the local var underscore _total_w so other events can see it)
total_w = (array_length(options) * button_width) + ((array_length(options) - 1) * padding);
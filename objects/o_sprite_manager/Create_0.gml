global.game_solution = get_random_objects_from_tag("choice_images", 5);
global.max_index = array_length(global.game_solution);

duration = 0;
//frames = 30;
count = 0;

// Set speed based on difficulty
switch (global.difficulty_setting) {
    case "easy":
        frames = 60; // Slow (1 second per image)
        break;
        
    case "medium":
        frames = 30; // Normal (0.5 seconds per image)
        break;
        
    case "hard":
        frames = 10; // Fast (0.16 seconds per image)
        break;
        
    default:
        frames = 30;
        break;
}
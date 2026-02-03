global.game_solution = get_random_objects_from_tag("choice_images", 5);
global.max_index = array_length(global.game_solution);

duration = 0;
count = 0;

switch (global.difficulty_setting) {
    case "easy":
        frames = 60;
        break;
    case "medium":
        frames = 30;
        break;
    case "hard":
        frames = 10;
        break;
    default:
        frames = 30;
        break;
}
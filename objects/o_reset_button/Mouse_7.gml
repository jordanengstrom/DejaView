// Check if the manager exists to prevent a crash
if (instance_exists(o_assembly_manager)) {
    
    // Access the manager object and clear the array
    global.user_selection = [];
    // Clear the win/loss message so the UI looks fresh
    global.msg = "";
}
for (var i=0; i < global.max_index; i++;){
	var inst = instance_create_layer(0, 0, "assembly_layer", global.game_solution[i]);
	inst.visible = false;
}
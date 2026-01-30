duration++;
if (duration == frames && count == (global.max_index - 1))
{
	room_goto(r_assembly);
}
if (duration == frames && count < global.max_index){
    duration = 0;
	count += 1;
}
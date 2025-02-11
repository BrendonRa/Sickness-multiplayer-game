if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) {
	cur_index++
}
if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) {
	cur_index--
}
if keyboard_check_pressed(vk_enter) {
	switch cur_index {
		case 0:
			cur_index = 0
			room_goto(Rm_mataMata)
			break
			
		case 1:
			cur_index = 0
			room_goto(Rm_controls)
			break
			
		case 2:
			cur_index = 0
			room_goto(Rm_credits)
			break
	}
}

cur_index = clamp(cur_index, 0, array_length(menu) -1)

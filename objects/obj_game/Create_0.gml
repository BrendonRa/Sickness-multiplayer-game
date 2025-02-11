rollback_define_player(obj_player, "Jogadores");
rollback_define_input(
{
    left: [vk_left, ord("A")],
    right: [vk_right, ord("D")],
    up: [vk_up, ord("W")],
    down: [vk_down, ord("S")],
    mb_x: m_axisx,
    mb_y: m_axisy,
    mouleft: mb_left,
	en: vk_enter
});
if !rollback_game_running and room == Rm_mataMata
{
	var _join = rollback_join_game()
    if (!_join) rollback_create_game(2)
}

if rollback_join_game(true) {
	room_goto(Rm_mataMata)
}

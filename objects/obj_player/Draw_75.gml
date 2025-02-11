if !self.dead and player_local draw_healthbar((view_wport / 2) - 120, view_hport - 50, (view_wport / 2) + 120, view_hport - 20, self.player_health, c_black, c_red, c_lime, 0, true, true);

if self.dead and player_local {
	team_draw(self.caracter_player, self.caracter, self.c_index)
}

if player_local and !self.dead {
	draw_text((view_wport / 10 * 2) - 50, (view_hport / 10 * 1) - 25, "Points Remedy")
	draw_text((view_wport / 10 * 2), view_hport / 10 * 1, points_blue)
	draw_text((view_wport / 10 * 8) - 50, (view_hport / 10 * 1) - 25, "Points Sickness")
	draw_text((view_wport / 10 * 8), view_hport / 10 * 1, points_red)
}

if points_blue >= 5 {
	final_interface(self.tim, true)
}

if points_red >= 5 {
	final_interface(self.tim, false)
}

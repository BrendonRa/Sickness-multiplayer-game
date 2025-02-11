if (!self.dead) {
	if (other.player == self and self.caracter_player == self.caracter[1] and self.player_project == 3) exit
	if (other.player == self and self.caracter_player == self.caracter[3] and self.player_project == 2) exit
	
	effect_create_above(ef_ring, x, y, 0, c_white);
        
	instance_destroy(other);
	
	self.player_health -= 40;
}

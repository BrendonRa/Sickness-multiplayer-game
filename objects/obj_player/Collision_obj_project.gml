if (!self.dead) {
	if (other.player == self and self.caracter_player == self.caracter[0] and self.player_project == 0) exit
	if (other.player == self and self.caracter_player == self.caracter[2] and self.player_project == 1) exit
	
	effect_create_above(ef_ring, x, y, 0, c_white);
        
	instance_destroy(other);
	
	if self.caracter_player == self.caracter[0] {
		self.player_health -= 50;
	}
	if self.caracter_player == self.caracter[2] {
		self.player_health -= 10;
	}
}

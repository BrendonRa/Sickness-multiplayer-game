
// movimentação e colissão
var _input = rollback_get_input()

var _parede = place_meeting(x, y, obj_wall);

vel_horizontal=(_input.right - _input.left) * my_speed;
vel_vertical=(_input.down - _input.up) * my_speed;

// Atirar projeteis
direction = point_direction(x, y, _input.mb_x, _input.mb_y);

if self.tim == "azul" cursor_sprite = spr_remedy_target
if self.tim == "vermelho" cursor_sprite = spr_sickness_target

if points_blue >= 5 {
	self.dead = true
	final = true
	if _input.en_released {
		final = false
		self.tim = ""
		points_red = 0
		points_blue = 0
	}
}

if points_red >= 5 {
	self.dead = true
	final = true
	if _input.en_released {
		final = false
		self.tim = ""
		points_red = 0
		points_blue = 0
	}
}

if self.caracter_player == self.caracter[0] {
	self.caracter_spr = [spr_gripento_front_walk,
	spr_gripento_side_r_walk,
	spr_gripento_back_walk,
	spr_gripento_side_l_walk,
	spr_gripento_front_idle,
	spr_gripento_back_idle,
	spr_gripento_side_r_idle,
	spr_gripento_side_l_idle]
	
	self.player_project = 0
} else if self.caracter_player == self.caracter[1] {
	self.caracter_spr = [spr_raivoroso_front_walk,
	spr_raivoroso_side_r_walk,
	spr_raivoroso_back_walk,
	spr_raivoroso_side_l_walk,
	spr_raivoroso_front_idle,
	spr_raivoroso_back_idle,
	spr_raivoroso_side_r_idle,
	spr_raivoroso_side_l_idle]
	
	self.player_project = 3
	player_atack_spr = [spr_raivoroso_front_atack, spr_raivoroso_side_r_atack, spr_raivoroso_back_atack, spr_raivoroso_side_l_atack]
} else if self.caracter_player == self.caracter[2] {
	self.caracter_spr = [spr_don_primido_front_walk,
	spr_don_primido_side_r_walk,
	spr_don_primido_back_walk,
	spr_don_primido_side_l_walk,
	spr_don_primido_front_idle,
	spr_don_primido_back_idle,
	spr_don_primido_side_r_idle,
	spr_don_primido_side_l_idle] 
	
	self.player_project = 1
} else if self.caracter_player == self.caracter[3] {
	self.caracter_spr = [spr_vagner_front_walk,
	spr_vagner_side_r_walk,
	spr_vagner_back_walk,
	spr_vagner_side_l_walk,
	spr_vagner_front_idle,
	spr_vagner_back_idle,
	spr_vagner_side_r_idle,
	spr_vagner_side_l_idle]
	
	self.player_project = 2
	player_atack_spr = [spr_vagner_front_atk, spr_vagner_side_r_atk, spr_vagner_back_atk, spr_vagner_side_l_atk]
}

if !self.dead and self.player_project == 0 or self.player_project == 1 {
	if !rollback_start_game() {
		if (_input.mouleft_pressed and self.cooldown == true)
		{
			var _proj = instance_create_layer(x, y, layer, obj_project);
			
			_proj.speed = 10;
			_proj.direction = direction;
			_proj.image_angle = direction + 90;
			_proj.player = self;
			
			if self.player_project == 0 {
				_proj.sprite_index = spr_gripento_project
				self.cooldown = false
				alarm[0] = room_speed * 1
			}
			
			if self.player_project == 1 {
				_proj.sprite_index = spr_don_primido_project
				self.cooldown = false
				alarm[0] = room_speed * 0.3
			}
		}
	}
}

if !self.dead and self.player_project == 3 {
	if !rollback_start_game() {
		if (_input.mouleft_pressed and self.cooldown == true)
		{
			var _proj = instance_create_layer(x, y, layer, obj_atk_raivoroso);
			
			_proj.direction = direction
			_proj.image_angle = 0
			_proj.player = self;
			
			if self.player_project == 0 {
				self.cooldown = false
				alarm[0] = room_speed * 0.3
			}
		}
	}
}

if !self.dead {
	if (self.player_project == 2 or self.player_project == 3) and _input.mouleft_pressed {
		effect_create_above(ef_ring, x, y, 1, #990080);
		sprite_index = player_atack_spr[dir]
	} else if vel_vertical > 0 {
		sprite_index = self.caracter_spr[0]
		dir = 0
	} else if vel_horizontal > 0 {
		sprite_index = self.caracter_spr[1]
		dir = 1 
	} else if vel_vertical < 0 {
		sprite_index = self.caracter_spr[2]
		dir = 2
	} else if vel_horizontal < 0 {
		sprite_index = self.caracter_spr[3]
		dir = 3
	} else if vel_vertical == 0 {
		switch dir {
			case 0:
				sprite_index = self.caracter_spr[4]
				break
			case 2:
				sprite_index = self.caracter_spr[5]
				break
		}
	} else if vel_horizontal == 0 {
		switch dir {
			case 1:
				sprite_index = self.caracter_spr[6]
				break
			case 3:
				sprite_index = self.caracter_spr[7]
				break
		}
	}
}
image_xscale = 0.2
image_yscale = 0.2

if self.player_health <= 0 {
	self.dead = true
	sprite_index = spr_player_inv
} else self.dead = false

if self.dead and !final {
	if _input.left_pressed and self.c_index > 0 {
		if self.tim == "azul" and self.c_index == 1 {
			self.c_index = 0
			self.caracter_player = self.caracter[self.c_index]
		} else if self.tim == "vermelho" and self.c_index == 3 {
			self.c_index = 2
			self.caracter_player = self.caracter[self.c_index]
		} else if self.tim == "" {
			self.c_index = 0
			self.caracter_player = self.caracter[self.c_index]
		}
	}
	if _input.right_pressed and self.c_index < 3 {
		if self.tim == "azul" and self.c_index == 0 {
			self.c_index = 0
			self.caracter_player = self.caracter[self.c_index]
		} else if self.tim == "vermelho" and self.c_index == 2 {
			self.c_index = 2
			self.caracter_player = self.caracter[self.c_index]
		} else if self.tim == "" {
			self.c_index = 2
			self.caracter_player = self.caracter[self.c_index]
		}
	}
	if _input.en {
		if self.caracter_player == self.caracter[0] or self.caracter_player == self.caracter[1] {
			self.tim = "azul"						
			x = obj_area_remedy.x + (obj_area_remedy.sprite_width / 2)
			y = obj_area_remedy.y + (obj_area_remedy.sprite_height / 2)
			self.player_health = 100
			self.dead = false
			self.pass = 1
		} else if self.caracter_player == self.caracter[2] or self.caracter_player == self.caracter[3] {
			self.tim = "vermelho"
			x = obj_area_sickness.x + (obj_area_sickness.sprite_width / 2)
			y = obj_area_sickness.y + (obj_area_sickness.sprite_height / 2)
			self.player_health = 100
			self.dead = false
			self.pass = 1
		}
	}
}

if (self.dead and self.tim == "vermelho" and self.pass == 1) {
	points_blue += 1
	sprite_index = spr_player_inv
	self.pass = 0
} else if (self.dead and self.tim == "azul" and self.pass == 1) {
	points_red += 1
	sprite_index = spr_player_inv
	self.pass = 0
}

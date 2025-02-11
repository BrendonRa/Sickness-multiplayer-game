tim = ""
self.tim = ""

if (player_local)
{
	camera_set_view_target(view_camera[0], id);
}

sprite_index = spr_player_inv

x = room_width / 2
y = room_height / 2

c_index = 0
player_health = 0
points_red = 0
points_blue = 0
my_speed = 2
vel_horizontal = 0
vel_vertical = 0
dead = true
dir = 0
shooter = ""
caracter = ["gripento", "raivoroso", "don_primito", "vagner"]
caracter_player = ""
caracter_spr = [spr_gripento_front_walk, spr_gripento_side_r_walk, spr_gripento_back_walk, spr_gripento_side_l_walk, spr_gripento_front_idle, spr_gripento_back_idle, spr_gripento_side_r_idle, spr_gripento_side_l_idle]
player_project = 0
player_atack_spr = [spr_raivoroso_front_atack, spr_raivoroso_side_r_atack, spr_raivoroso_back_atack, spr_raivoroso_side_l_atack]
pass = 0
final = false
cooldown = true

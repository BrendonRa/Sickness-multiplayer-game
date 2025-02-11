randomize()
back_color = #990000
glo = []
for (var _t = 1; _t <= 70; _t++) {
	var _cir_x = random(room_width)
	var _cir_y = random(room_height)
	var _cir_color = [ #880000, #770000, #660000, #550000 ]
	var _dir_x = round(random_range(1, 2))
	var _dir_y = round(random_range(1, 2))
	var _cir_size = (round(random(3)) + 1) * 10
	var _a = (_cir_size / 10 - 1)
	var _globi = {
		position_x: _cir_x,
		position_y: _cir_y,
		c_size: _cir_size,
		c_color: _cir_color[_a],
		d_x: _dir_x,
		d_y: _dir_y,
		c_speed: 0.1 * (random(9) + 1)
	}
	array_push(glo, _globi)
}

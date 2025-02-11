draw_set_font(font_title)
draw_rectangle_color(0, 0, room_width, room_height, #990000, #990000, #990000, #990000, false)

for (var _i = 0; _i <= array_length(glo) - 1; _i++) {
	var _g = glo[_i]
	if (_g.position_x < (room_width - room_width) - glo[_i].c_size or _g.position_x > room_width + glo[_i].c_size) {
		_g.d_x = _g.d_x == 2 ? 1 : 2
	}
	if (_g.position_y < (room_height - room_height) - glo[_i].c_size or _g.position_y > room_height + glo[_i].c_size) {
		_g.d_y = _g.d_y == 2 ? 1 : 2
	}
	_g.position_x += _g.c_speed * (1 * _g.d_x == 2 ? -1 : 1)
	_g.position_y += _g.c_speed * (1 * _g.d_y == 2 ? -1 : 1)
	draw_circle_color(_g.position_x, _g.position_y, _g.c_size, _g.c_color, _g.c_color, false)
}

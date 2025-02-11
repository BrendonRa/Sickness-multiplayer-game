function team_draw(_cp, _c, _ci) {
	draw_rectangle_color(0, 0, room_width, room_height, #990000, #990000, #990000, #990000, false)
	
	var _f = 0
	for (var _i = 1; _i <= 7; _i += 2) {
		var w1 = (view_wport / 8) * _i
		var h1 = (view_hport / 8) * 2.5
		var w2 =(view_wport / 8) * (_i + 1)
		var h2 = (view_hport / 8) * 5.5
		
		draw_rectangle_color(w1, h1, w2, h2, #990000, #990000, #990000, #990000, false)
		
		if _cp == _c[_f] {
			draw_rectangle_color(w1, h1, w2, h2, c_white, c_white, c_white, c_white, true)
		}
		_f++
	}
	
	draw_sprite_ext(spr_gripento_side_r_idle, 0, (view_wport / 8) * 1.5, (view_hport / 8) * 4, 1.3, 1.3, 0, c_white, 1)
	draw_sprite_ext(spr_raivoroso_side_r_idle, 0, (view_wport / 8) * 3.5, (view_hport / 8) * 4, 1.3, 1.3, 0, c_white, 1)
	draw_sprite_ext(spr_don_primido_side_l_idle, 0, (view_wport / 8) * 5.5, (view_hport / 8) * 4, 1.3, 1.3, 0, c_white, 1)
	draw_sprite_ext(spr_vagner_side_l_idle, 0, (view_wport / 8) * 7.5, (view_hport / 8) * 4, 1.3, 1.3, 0, c_white, 1)
}

function men_draw(_men, _c) {
	draw_set_halign(fa_center)
	for (var _i = 0; _i < array_length(_men); _i++) {
		draw_set_color(_c == _i?#009090:c_white)
		draw_text_transformed(view_wport / 2, view_hport/2.3+100*_i, _men[_i], 2.8, 2.0, 0)
		draw_set_color(c_white)
	}
	draw_set_halign(fa_left)
}

function button_area(_mx, _my, _r, _wid, _hei, _cir, _rm) {
	if _cir and mouse_check_button_pressed(mb_left) {
		if mouse_x >= _mx - _r and mouse_x <= _mx + _r and mouse_y >= _my - _r and mouse_y <= _my + _r {
			room_goto(_rm)
		}
	} else if !_cir and mouse_check_button_pressed(mb_left) {
		if mouse_x >= _mx and mouse_x <= _wid and mouse_y >= _my and mouse_y <= _hei {
		}
	}
}

function final_interface(_t, _va) {
	if _t == "azul" and _va {
		draw_text_ext_transformed_color(view_wport / 10 * 4, view_hport / 10 * 1, "Victory", 5, 500, 5, 5, 0, #007700, #007700, #007700, #007700, 1)
	} else if _t == "vermelho" and _va {
		draw_text_ext_transformed_color(view_wport / 10 * 4, view_hport / 10 * 1, "Defeat", 20, 500, 5, 5, 0, #000000, #000000, #000000, #000000, 1)
	}
	
	if _t == "azul" and !_va {
		draw_text_ext_transformed_color(view_wport / 10 * 4, view_hport / 10 * 1, "Defeat", 20, 500, 5, 5, 0, #000000, #000000, #000000, #000000, 1)
	} else if _t == "vermelho" and !_va {
		draw_text_ext_transformed_color(view_wport / 10 * 4, view_hport / 10 * 1, "Victory", 5, 500, 5, 5, 0, #007700, #007700, #007700, #007700, 1)
	}
}

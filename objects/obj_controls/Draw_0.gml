var _msg = 
@"
--------------------------------------

A - W - S - D: movimentation
Mouse left click: shoot

--------------------------------------

A - W - S - D: movimentacao
Mouse esquerda clique: atirar

--------------------------------------

A - W - S - D: movimiento
Mouse esquerda clique: disparar

--------------------------------------
"

draw_set_font(font_main)
draw_roundrect_color_ext(room_width / 10, room_height / 10, (room_width / 10) * 9, (room_height / 10) * 9, 25, 25, #600000, #700000, false)
draw_text_transformed_color(room_width / 10 * 4.5, room_height / 10 * 1.2, "Controls", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
draw_text_color((room_width / 10) * 1.1, (room_height / 10) * 2, _msg, c_white, c_white, c_white, c_white, 1)

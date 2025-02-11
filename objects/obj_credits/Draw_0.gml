var _msg = 
@"
----------------------------------------------------

Brendon - Programation and interfaces
Guilherme Theodoro - Pixel arts and planification
Aaron - Maps and planification

----------------------------------------------------

Brendon - Programacion y interfaces
Guilherme Theodoro - Pixel arts y planificacion
Aaron - Mapas y planificacion

----------------------------------------------------

Brendon - Programacao e interfaces
Guilherme Theodoro - Pixel arts e planejamentos
Aaron - Mapas e planejamentos

----------------------------------------------------
"

draw_set_font(font_main)
draw_roundrect_color_ext(room_width / 10, room_height / 10, (room_width / 10) * 9, (room_height / 10) * 9, 25, 25, #600000, #700000, false)
draw_text_transformed_color(room_width / 10 * 4.5, room_height / 10 * 1.2, "Credits", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
draw_text_color((room_width / 10) * 1.1, (room_height / 10) * 2, _msg, c_white, c_white, c_white, c_white, 1)


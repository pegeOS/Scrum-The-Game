draw_self()
draw_set_colour(global.azul)
draw_set_alpha(1)
draw_set_font(fnt_windows_grande)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//desenhando texto timer
draw_text_transformed(x - 8, y, ceil(tempo / 60), 1.4, 1.4, 0)

draw_set_colour(c_white)
draw_set_font(fnt_windows)
draw_set_halign(-1)
draw_set_valign(-1)
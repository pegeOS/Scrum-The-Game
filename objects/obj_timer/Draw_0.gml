draw_self()
if(tempo <= 300) draw_set_colour(c_yellow)
else draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_font(fnt_windows_grande)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//desenhando texto timer
draw_text_transformed(x - 11, y - 2, ceil(tempo / 60), 1.4, 1.4, 0)

draw_set_colour(c_white)
draw_set_font(fnt_windows)
draw_set_halign(-1)
draw_set_valign(-1)
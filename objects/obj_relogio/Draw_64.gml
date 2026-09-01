

draw_self()

draw_set_font(fnt_windows);
draw_set_color(c_red); // Deixe vermelho para achar fácil
draw_set_halign(fa_center); // <--- Mude para fa_left aqui!
draw_set_valign(fa_middle);
draw_set_alpha(1)

draw_text_transformed(x, y, texto_horario, 2, 2, 0); 

draw_set_alpha(-1)
draw_set_halign(fa_left); 
draw_set_valign(fa_top);
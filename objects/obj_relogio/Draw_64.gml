

draw_self()

draw_set_font(fnt_windows);
draw_set_halign(fa_center); // <--- Mude para fa_left aqui!
draw_set_valign(fa_middle);
draw_set_alpha(1)

draw_text_transformed_colour(x, y, texto_horario, 2, 2, 0, cor, cor, cor, cor, 1); 

draw_set_alpha(-1)
draw_set_halign(fa_left); 
draw_set_valign(fa_top);
draw_set_colour(-1)
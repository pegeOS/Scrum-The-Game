
draw_set_font(fnt_windows);
draw_set_alpha(1)

draw_text_transformed_colour(x + 45, y - 25, texto_horario, 2, 2, 0, cor, cor, cor, cor, 1); 

draw_set_halign(-1); 
draw_set_valign(-1);
draw_set_colour(-1)

draw_text_transformed_colour(x - 50, y - 10, "DIA " + string(global.dia_atual) + " - ", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1)
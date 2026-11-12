draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_windows_grande)

if (!acabou) {
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_text(hud_x, hud_y, "Bugs: " + string(instance_number(obj_bug)))
    draw_text(hud_x, hud_y + 45, "Tempo: " + string(ceil(tempo_restante)))
} else {
    // mesma mensagem e mesmo estilo (escala 1 x 0.6) da transição de dia
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_alpha(fim_alpha)
    draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2 - 80, "SPRINT CONCLUIDA: " + string(global.progresso) + "%", 1, 0.6, 0)
	
}

draw_set_alpha(1)
draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
draw_set_colour(-1)
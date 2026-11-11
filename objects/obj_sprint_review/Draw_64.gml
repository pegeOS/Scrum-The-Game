draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_windows_grande)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(hud_x, hud_y, "Bugs: " + string(instance_number(obj_bug)))
draw_text(hud_x, hud_y + 45, "Tempo: " + string(ceil(tempo_restante)))

if (acabou) {
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "SPRINT CONCLUIDA: " + string(global.progresso) + "%")
}

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
draw_set_colour(-1)
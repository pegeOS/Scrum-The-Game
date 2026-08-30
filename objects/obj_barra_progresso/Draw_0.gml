
draw_self()

draw_set_font(fnt_windows_grande)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var amount = (global.progresso / progresso_max) * barra_w	

draw_set_colour( global.azul)

draw_text_transformed(x - 118, y + 20, "Progresso: ", 1, 1, 0)
//barras e barras

draw_sprite_stretched_ext(spr_botao2, 0, x - 10, y - 6, barra_w + 10, barra_h + 10, c_white, 1)
draw_rectangle(x, y, x + amount, y + barra_h - 5, false)

//escrevendo porcentagem
draw_text_transformed(x + 260, y + 20, string(global.progresso) + "%", 1, 1, 0)

draw_set_font(-1)
draw_set_colour(-1)
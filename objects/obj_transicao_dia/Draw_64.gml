

if (alpha_tela > 0 || estado == "digitando" || estado == "esperando_texto") {
    
    // desenha o fundo preto cobrindo toda a tela
    draw_set_alpha(alpha_tela)
    draw_set_colour(c_black)
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
    
    // desenha o texto centralizado com efeito de digitação
    if (texto_desenhado != "") {
        draw_set_font(fnt_windows_grande)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_colour(c_white)
        draw_set_alpha(alpha_tela) // faz o texto sumir junto com o fundo preto no fade out
        
        var _centro_x = display_get_gui_width() / 2
        var _centro_y = display_get_gui_height() / 2
        
        draw_text_transformed(_centro_x, _centro_y, texto_desenhado, 1, 0.6, 0)
    }
    
    // reseta as configuracoes do draw
    draw_set_alpha(1)
    draw_set_halign(-1)
    draw_set_valign(-1)
    draw_set_font(-1)
}
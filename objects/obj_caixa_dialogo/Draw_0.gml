// Desenha a caixa de diálogo (fundo preto)
draw_set_color(c_black);
draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_largura, caixa_y + caixa_altura, false);

// Desenha a borda da caixa (branca)
draw_set_color(c_white);
draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_largura, caixa_y + caixa_altura, true);

// Desenha o sprite do Chefe redimensionado para caber na caixa
// (Substitua 'spr_chefe' pelo nome exato do seu sprite, se for diferente)
// Os valores 80 e 100 forçam a largura e altura da imagem
draw_sprite_stretched(spr_chefe, 0, caixa_x + 10, caixa_y + 10, 80, 100);

// Configurações do texto
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Desenha a pergunta atual ou a mensagem final
if (indice_atual < array_length(perguntas)) {
    // Texto movido para X + 110 para não ficar em cima do chefe
    draw_text(caixa_x + 110, caixa_y + 20, perguntas[indice_atual]);
} 
else {
    // Desenha a mensagem de encerramento
    draw_text(caixa_x + 110, caixa_y + 20, "A Daily encerrou! Bom trabalho.");
    
    // Texto menor indicando como fechar
    draw_set_color(c_gray);
    draw_text(caixa_x + 110, caixa_y + 80, "(Clique em qualquer lugar para fechar)");
}
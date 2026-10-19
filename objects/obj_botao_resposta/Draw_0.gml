draw_self(); // Desenha o sprite do botão

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Desenha o texto recebido da caixa de diálogo no centro do botão
draw_text(x, y, texto);
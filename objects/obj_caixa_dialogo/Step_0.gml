if (!esperando_resposta && indice_atual < array_length(perguntas)) {
    esperando_resposta = true;
    
    var array_opcoes = respostas[indice_atual];
    var qtd_opcoes = array_length(array_opcoes);
    
    var start_y = (room_height / 2) - ((qtd_opcoes * 50) / 2);
    var centro_x = room_width / 2;
    
    for (var i = 0; i < qtd_opcoes; i++) {
        var btn = instance_create_layer(centro_x, start_y + (i * 50), "Instances", obj_botao_resposta);
        btn.texto = array_opcoes[i];
        btn.id_dialogo = id;
    }
} 
else if (indice_atual >= array_length(perguntas)) {
    // A Daily acabou. Aguarda o jogador clicar em qualquer lugar da tela para fechar.
    if (mouse_check_button_pressed(mb_left)) {
        instance_destroy();
    }
}